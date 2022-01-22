const String sarTitle = "Standalone Synthetic Aperture Radar (SAR)";
const String sarImage = "https://i.imgur.com/xlf4B8p.png";
const String sarKey = "SAR";
const String sarDesc =
    "For automatic sea ice charting models, it can be advantageous to utilize independent SAR data over data fusion models, such as the combination of SAR and Passive Microwave Radiometers. This allows for a simple operational data pipeline, enabling ice chart production during periods when the secondary data source is not available – maximizing production and speed of ice charts. However, there are difficult scenarios and ambiguities, such as SAR noise, narrow fjords, wind-roughened seas, and homogenous and landfast sea ice, that must be solved with high reliability and certainty.";

const String ganTitle = "Generative Adversarial Networks (GANs)";
const String ganImage = "https://i.imgur.com/ZSGu0Ir.png";
const String ganKey = "GAN";
const String ganDesc =
    "Professional sea ice analysts who make sea ice charts do so by interpreting microwave Synthetic Aperture Radar (SAR) signatures and drawing polygons in a creative process with an associated set of rules. This is similar to the art of painting a portrait or a fixed object, constrained by creativity and a task without a singular correct solution. Therefore, a trivial deep learning approach that simply maps input to the output may not be a suitable technique for automating human endeavours. However, the contemporary developments of generative neural networks could be a potential avenue for automating this process in a creative and potentially unsupervised or semi-supervised way.";

const String ai4Title = "AI4Arctic Sea Ice Dataset";
const String ai4Image = "https://i.imgur.com/GOXDR7g.png";
const String ai4Key = "AI4";
const String air4Desc =
    "The project involves developing a third version of an AI-ready dataset to train Deep Learning models for automatic sea ice charting. The new version will contain Synthetic Aperture Radar (SAR), Passive Microwave Radiometer (PMR), hand-drawn ice charts made by professional ice analysts (made from the SAR image), as well as auxiliary variables such as wind speed, surface temperature data. This dataset will be used to host an international competition on sea ice charting. The second version of the dataset is available here.";

const String sentinelTitle =
    "Sentinel-1 Synthetic Aperture Radar (SAR) interferometric analysis of permafrost thawing cycle in West Greenland";
const String sentinelImage = "https://i.imgur.com/e2l7PhH.png";
const String sentinelKey = "Sentinel";
const String sentinelDesc =
    "Global warming is increasing temperatures in the Arctic and causes previously frozen permafrost to melt and freeze. This creates a thawing and melting cycle with previous solid soil contracting and expanding, respectively. Incredibly, this centimeter elevation change can be monitored from space using SAR interferometry, comparing the distance which the radar wave travels. An analysis was carried out in Western Greenland, observing in some places up to 5 cm elevation change during summer.";

const String studentImage1 = "https://i.imgur.com/fXVNHUv.png";
const String studentImage2 = "https://i.imgur.com/1pNSNQW.png";

final AHero sar = AHero(
  title: sarTitle,
  image: sarImage,
  tag: sarKey,
  desc: sarDesc,
);

final AHero gan = AHero(
  title: ganTitle,
  image: ganImage,
  tag: ganKey,
  desc: ganDesc,
);

final AHero ai4 = AHero(
  title: ai4Title,
  image: ai4Image,
  tag: ai4Key,
  desc: air4Desc,
);

final AHero sentinel = AHero(
  title: sentinelTitle,
  image: sentinelImage,
  tag: sentinelKey,
  desc: sentinelDesc,
);

final List<AHero> heroes = [
  sar,
  gan,
  ai4,
  sentinel,
];

class AHero {
  final String title;
  final String image;
  final String tag;
  final String desc;

  AHero(
      {required this.title,
      required this.image,
      required this.tag,
      required this.desc});
}
