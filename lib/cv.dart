import 'package:astokholm/pdf_controller_arrows.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class CV extends StatefulWidget {
  const CV({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  _CVState createState() => _CVState();
}

// TODO - https://stackoverflow.com/a/61395912/11255140
class _CVState extends State<CV> {
  int _actualPageNumber = 1, _allPagesCount = 3;
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/cvandreasstokholm.pdf'),
    viewportFraction: 1,
  );

  late ByteData bytes;

  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  child: const Icon(
                    Icons.file_download,
                    size: 30,
                  ),
                  onTap: () async {
                    bytes =
                        await rootBundle.load('assets/cvandreasstokholm.pdf');
                    final blob = html.Blob([bytes], 'application/pdf');
                    final url = html.Url.createObjectUrlFromBlob(blob);
                    final anchor = html.AnchorElement()
                      ..href = url
                      ..style.display = 'none'
                      ..download = 'AndreasStokholmCV.pdf';
                    html.document.body?.children.add(anchor);
                    anchor.click();
                    html.document.body?.children.remove(anchor);
                    html.Url.revokeObjectUrl(url);
                  },
                ),
              ),
              Text(
                'CV',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).textTheme.headline5?.color,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyArrow(
                direction: Direction.left,
                pageController: pdfController,
              ),
              Text('Read: $_actualPageNumber of $_allPagesCount'),
              MyArrow(
                direction: Direction.right,
                pageController: pdfController,
              ),
            ],
          ),
        ),
        SizedBox(
          width: widget.width,
          height: isWebMobile
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * 2,
          child: PdfView(
            controller: pdfController,
            onDocumentLoaded: (document) {
              setState(() {
                _allPagesCount = document.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _actualPageNumber = page;
              });
            },
            pageSnapping: !isWebMobile,
            pageBuilder: (
              Future<PdfPageImage> pageImage,
              int index,
              PdfDocument document,
            ) =>
                PhotoViewGalleryPageOptions(
              imageProvider: PdfPageImageProvider(
                pageImage,
                index,
                document.id,
              ),
              basePosition: const Alignment(0, -1),
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.contained * 3.0,
              initialScale: PhotoViewComputedScale.contained * 1.3,
              heroAttributes:
                  PhotoViewHeroAttributes(tag: '${document.id}-$index'),
            ),
          ),
        ),
      ],
    );
  }
}
