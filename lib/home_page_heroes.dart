import 'package:flutter/material.dart';

import 'heroes.dart';

// Using content from https://imgur.com/a/mZ9DeQA
// And https://arstokholm.wordpress.com/projects/

/// A row of Heroes, that link to the HeroDetailPage.
/// Contains the Projects from https://imgur.com/a/mZ9DeQA and https://arstokholm.wordpress.com/projects/
/// Use Images with a Title. Then in the Hero Detail Page, the details are displayed.
class HomePageHeroes extends StatelessWidget {
  const HomePageHeroes({Key? key}) : super(key: key);

  final Heroes heroes = Heroes();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
