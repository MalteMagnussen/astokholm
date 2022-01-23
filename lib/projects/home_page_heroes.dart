import 'package:cached_network_image/cached_network_image.dart';
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
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      direction: Axis.horizontal,
      spacing: 10,
      children: heroes.map<Widget>((hero) {
        return SizedBox(
          height: 380,
          width: 400,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  hero.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              InkWell(
                mouseCursor: MaterialStateMouseCursor.clickable,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    hero.tag,
                  );
                },
                child: Hero(
                  tag: hero.tag,
                  child: CachedNetworkImage(
                    height: 300,
                    imageUrl: hero.image,
                    placeholder: (context, url) => const SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
