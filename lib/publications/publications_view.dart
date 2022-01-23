import 'package:flutter/material.dart';

class PublicationsView extends StatefulWidget {
  const PublicationsView({Key? key}) : super(key: key);

  @override
  _PublicationsViewState createState() => _PublicationsViewState();
}

class _PublicationsViewState extends State<PublicationsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: '\n'),
            TextSpan(
              text:
                  'Andreas Stokholm, Sine M. Hvidegaard, René Forsberg, and Sebastian B. Simonsen.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const TextSpan(text: '\n'),
            TextSpan(
              text:
                  'Validation of airborne and satellite altimetry data by arctic trucks citizen science.',
              style: Theme.of(context).textTheme.bodyText2?.apply(
                    fontStyle: FontStyle.italic,
                  ),
            ),
            const TextSpan(text: '\n'),
            TextSpan(
              text:
                  'Geological Survey of Denmark and Greenland (geus) Bulletin, 47(1):5369, 2021.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
