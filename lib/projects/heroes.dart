const String sarTitle =
    "Standalone Synthetic Aperture Radar (SAR) for Sea Ice Charting";
const String sarImage = "https://i.imgur.com/xlf4B8p.png";
const String sarKey = "SAR";
const String sarDesc =
    "For automatic sea ice charting models, it can be advantageous to utilize independent SAR data over data fusion models, such as the combination of SAR and Passive Microwave Radiometers. This allows for a simple operational data pipeline, enabling ice chart production during periods when the secondary data source is not available – maximizing production and speed of ice charts. However, there are difficult scenarios and ambiguities, such as SAR noise, narrow fjords, wind-roughened seas, and homogenous and landfast sea ice, that must be solved with high reliability and certainty.";

const String ganTitle =
    "Generative Adversarial Networks (GANs) for Sea Ice Charting";
const String ganImage = "https://i.imgur.com/ZSGu0Ir.png";
const String ganKey = "GAN";
const String ganDesc =
    "Professional sea ice analysts who make sea ice charts do so by interpreting microwave Synthetic Aperture Radar (SAR) signatures and drawing polygons in a creative process with an associated set of rules. This is similar to the art of painting a portrait or a fixed object, constrained by creativity and a task without a singular correct solution. Therefore, a trivial deep learning approach that simply maps input to the output may not be a suitable technique for automating human endeavours. However, the contemporary developments of generative neural networks could be a potential avenue for automating this process in a creative and potentially unsupervised or semi-supervised way.";

const String ai4Title = "AI4Arctic Sea Ice Dataset";
const String ai4Image = "https://i.imgur.com/GOXDR7g.png";
const String ai4Key = "AI4";
const String air4Desc =
    "The project involves developing a third version of an AI-ready dataset to train Deep Learning models for automatic sea ice charting. The new version will contain Synthetic Aperture Radar (SAR), Passive Microwave Radiometer (PMR), hand-drawn ice charts made by professional ice analysts (made from the SAR image), as well as auxiliary variables such as wind speed, surface temperature data. This dataset will be used to host an international competition on sea ice charting.";
const String air4Link =
    "https://data.dtu.dk/articles/dataset/AI4Arctic_ASIP_Sea_Ice_Dataset_-_version_2/13011134";
const String air4LinkText =
    "The second version of the dataset is available here.";

const String sentinelTitle =
    "Sentinel-1 Synthetic Aperture Radar (SAR) interferometric analysis of permafrost thawing cycle in West Greenland";
const String sentinelImage = "https://i.imgur.com/e2l7PhH.png";
const String sentinelKey = "Sentinel";
const String sentinelDesc =
    "Global warming is increasing temperatures in the Arctic and causes previously frozen permafrost to melt and freeze. This creates a thawing and melting cycle with previous solid soil contracting and expanding, respectively. Incredibly, this centimeter elevation change can be monitored from space using SAR interferometry, comparing the distance which the radar wave travels. An analysis was carried out in Western Greenland, observing in some places up to 5 cm elevation change during summer.";

const String studentImage1 = "https://i.imgur.com/fXVNHUv.png";
const String studentImage2 = "https://i.imgur.com/1pNSNQW.png";
const String studentDesc = """
I supervise a number of university student projects with future suggestions in the DTU Project Bank. Feel free to contact me, if you would like to have me as your supervisor or be involved as a co-supervisor.

2022 Spring, Bachelor Thesis, Satellite Tracking with Neuromorphic / Event-Based Cameras

2022 Spring, Bachelor Thesis, NO2 measurements from Sentinel-5P over Denmark

2022 Spring, Master Project, Automated Marine Gravity Surveys in Danish Waters: Machine Learning and Automated Processing of Survey Lines

2021 Fall, Master Project, Estimating sea ice concentrations from AMSR-2 microwave radiometer data using convolutional neural network (CNN)

2021 Spring, Introductory Project, A comparison of Sentinel-5P NO2 measurements over Denmark before and after COVID-19

2021 Spring, Introductory Project, Investigation of Sentinel-5P methane measurements over Denmark

2019-2022, Engineering practices, first-semester bachelor course. Construct a digital instrument to measure pollution.
""";
const String studentLink =
    "https://projektbank.dtu.dk/en-us/Pages/Search.aspx?ds=1&adv=1&hso=1&Empid=dfc7b884-b884-e511-80dd-005056a057de";
const String studentTag = "student";
const String studentLinkText = "DTU Project Bank";

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
  link: air4Link,
  linkText: air4LinkText,
);

final AHero sentinel = AHero(
  title: sentinelTitle,
  image: sentinelImage,
  tag: sentinelKey,
  desc: sentinelDesc,
);

final AHero student = AHero(
  title: "Student Projects",
  image: studentImage1,
  tag: studentTag,
  desc: studentDesc,
  link: studentLink,
  linkText: studentLinkText,
);

final List<AHero> heroes = [
  sar,
  gan,
  ai4,
  sentinel,
  student,
];

class AHero {
  final String title;
  final String image;
  final String tag;
  final String desc;
  final String link;
  final String linkText;

  AHero({
    required this.title,
    required this.image,
    required this.tag,
    required this.desc,
    this.link = "",
    this.linkText = "",
  });
}
