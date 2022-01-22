import 'package:flutter/material.dart';

// Using content from https://imgur.com/a/mZ9DeQA
// And https://arstokholm.wordpress.com/projects/

/// A row of Heroes, that link to the HeroDetailPage.
/// Contains the Projects from https://imgur.com/a/mZ9DeQA and https://arstokholm.wordpress.com/projects/
/// Use Images with a Title. Then in the Hero Detail Page, the details are displayed.
class HomePageHeroes extends StatelessWidget {
  const HomePageHeroes({Key? key}) : super(key: key);

  final String sarTitle =
      "Standalone Synthetic Aperture Radar (SAR) for Sea Ice Charting";
  final String sarImage = "https://i.imgur.com/xlf4B8p.png";

  final String ganTitle =
      "Generative Adversarial Networks (GANs) for Sea Ice Charting";
  final String ganImage = "https://i.imgur.com/ZSGu0Ir.png";

  final String ai4Title = "AI4Arctic Sea Ice Dataset";
  final String ai4Image = "https://i.imgur.com/GOXDR7g.png";

  final String sentinalTitle =
      "Sentinel-1 Synthetic Aperture Radar (SAR) interferometric analysis of permafrost thawing cycle in West Greenland";
  final String sentinalImage = "https://i.imgur.com/e2l7PhH.png";

  final String studentImage1 = "https://i.imgur.com/fXVNHUv.png";
  final String studentImage2 = "https://i.imgur.com/1pNSNQW.png";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
