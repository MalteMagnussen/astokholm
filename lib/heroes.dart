const String sarTitle = "Standalone Synthetic Aperture Radar (SAR)";
const String sarImage = "https://i.imgur.com/xlf4B8p.png";
const String sarKey = "SAR";

const String ganTitle = "Generative Adversarial Networks (GANs)";
const String ganImage = "https://i.imgur.com/ZSGu0Ir.png";
const String ganKey = "GAN";

const String ai4Title = "AI4Arctic Sea Ice Dataset";
const String ai4Image = "https://i.imgur.com/GOXDR7g.png";
const String ai4Key = "AI4";

const String sentinalTitle =
    "Sentinel-1 Synthetic Aperture Radar (SAR) interferometric analysis of permafrost thawing cycle in West Greenland";
const String sentinalImage = "https://i.imgur.com/e2l7PhH.png";
const String sentinalKey = "Sentinel";

const String studentImage1 = "https://i.imgur.com/fXVNHUv.png";
const String studentImage2 = "https://i.imgur.com/1pNSNQW.png";

class Heroes {
  final Hero sar = Hero(
    title: sarTitle,
    image: sarImage,
    key: sarKey,
  );

  final Hero gan = Hero(
    title: ganTitle,
    image: ganImage,
    key: ganKey,
  );

  final Hero ai4 = Hero(
    title: ai4Title,
    image: ai4Image,
    key: ai4Key,
  );

  final Hero sentinel = Hero(
    title: sentinalTitle,
    image: sentinalImage,
    key: sentinalKey,
  );
}

class Hero {
  final String title;
  final String image;
  final String key;

  Hero({required this.title, required this.image, required this.key});
}
