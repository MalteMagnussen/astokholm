import 'package:flutter/material.dart';

import 'heroes.dart';

// Using content from https://imgur.com/a/mZ9DeQA
// And https://arstokholm.wordpress.com/projects/

/// A row of Heroes, that link to the HeroDetailPage.
/// Contains the Projects from https://imgur.com/a/mZ9DeQA and https://arstokholm.wordpress.com/projects/
/// Use Images with a Title. Then in the Hero Detail Page, the details are displayed.
class HomePageHeroes extends StatefulWidget {
  const HomePageHeroes({Key? key}) : super(key: key);

  @override
  State<HomePageHeroes> createState() => _HomePageHeroesState();
}

class _HomePageHeroesState extends State<HomePageHeroes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // Heroes are in a row.
      children: heroes.map<Widget>((hero) {
        return Hero(
          tag: hero.key,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, hero.key);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Image.network(hero.image),
                  Text(
                    hero.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
