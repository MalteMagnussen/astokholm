import 'package:astokholm/pdf_controller_arrows.dart';
import 'package:astokholm/profile_picture.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/foundation.dart';

// TODO - Add Projects.
// Add them as just titles, with Hero maybe? https://www.youtube.com/watch?v=Be9UH1kXFDw
// Refactor the others to the same thing.
// Long list of titles, with Hero animations.

// TODO - Add email somewhere.
// TODO - Add Publications

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andreas Stokholm',
      theme: ThemeData.dark(),
      // https://docs.flutter.dev/cookbook/design/themes
      home: const MyHomePage(title: 'Andreas Stokholm - CV and Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final String helloText =
      'Hi, my name is Andreas, an Electrical Engineer and a generalist by nature. '
      'I love diverse challenges within AI, data from satellites, sensors, and advanced computing for Earth and societal science. '
      'I also have a strong passion for entrepreneurship, investing, and public science communication.';
  final String olab =
      'The ϕ-lab is ESA’s innovative research laboratory that specializes in combining AI and data from satellites to monitor and further understand the Earth. '
      'This includes new space applications, AI edge computing in space, and new computing paradigms and the lab spearheaded the first satellite with onboard AI, ';
  final String titanic =
      'For the past 50 years, the Danish Meteorological Institute has drawn sea ice charts by hand to help ships in the Arctic '
      'navigating safely and find the quickest route through the sea ice. '
      'This task is done daily due to the dynamic nature of sea ice. '
      'It is a time-consuming and resource-intensive task that we hope to automate using Deep Learning and satellite data. '
      'Automating the production has the potential to increase the use of captured satellite imagery, '
      'deliver faster and more frequent map updates while providing a higher level of detail in the maps. '
      'Expanding the geographical coverage can help and further enable the Northern Trade Routes.';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/cvandreasstokholm.pdf'),
    viewportFraction: 1,
  );

  final double width = 1000;
  int _actualPageNumber = 1, _allPagesCount = 3;
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Andreas Stokholm',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      ProfilePicture(
                        width: 500,
                        height: constraints.maxHeight * 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ph.D. student in AI and Earth Observation',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      buildMainText(context),
                      CachedNetworkImage(
                        imageUrl: 'https://i.imgur.com/7DsgRkB.png',
                        placeholder: (context, url) => const SizedBox(
                          height: 400,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                      buildCV(context),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Column buildCV(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'CV',
            style: Theme.of(context).textTheme.headline5,
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
          width: width,
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

  Padding buildMainText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          children: [
            buildLink(
              'Technical University of Denmark',
              "https://www.dtu.dk/english",
              context,
            ),
            const TextSpan(text: '\n'),
            buildLink(
              'DTU Space: the National Space Institute',
              'https://www.space.dtu.dk/english',
              context,
            ),
            const TextSpan(text: '\n\n'),
            TextSpan(
              text: widget.helloText,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const TextSpan(text: '\n\n'),
            TextSpan(
              text: 'Visiting Researcher at the ',
              style: Theme.of(context).textTheme.headline6,
            ),
            buildLink(
              'European Space Agency (ESA)',
              'https://www.esa.int/',
              context,
            ),
            TextSpan(
              text: ', ',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            buildLink(
              'ϕ-lab',
              'https://phiweek.esa.int/',
              context,
            ),
            const TextSpan(text: '\n\n'),
            TextSpan(
              text: widget.olab,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            TextSpan(
              text: 'ϕ-sat-1.',
              style: Theme.of(context).textTheme.bodyText2?.apply(
                    color: Colors.blue,
                  ),
              mouseCursor: SystemMouseCursors.click,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch(
                    'https://www.esa.int/Applications/Observing_the_Earth/Ph-sat',
                  );
                },
            ),
            const TextSpan(text: '\n\n'),
            TextSpan(
              text:
                  'Preventing the next Titanic and enabling the Northern Trade Routes',
              style: Theme.of(context).textTheme.headline6,
            ),
            const TextSpan(text: '\n\n'),
            TextSpan(
              text: widget.titanic,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  TextSpan buildLink(String text, String link, BuildContext context) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.headline6?.apply(
            color: Colors.blue,
          ),
      mouseCursor: SystemMouseCursors.click,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launch(link);
        },
    );
  }
}
