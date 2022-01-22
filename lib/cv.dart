import 'package:astokholm/pdf_controller_arrows.dart';
import 'package:astokholm/profile_picture.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/foundation.dart';

class CV extends StatefulWidget {
  const CV({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  _CVState createState() => _CVState();
}

class _CVState extends State<CV> {
  int _actualPageNumber = 1, _allPagesCount = 3;
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/cvandreasstokholm.pdf'),
    viewportFraction: 1,
  );
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'CV',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
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
