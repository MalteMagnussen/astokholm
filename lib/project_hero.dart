import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'heroes.dart';

class ProjectHero extends StatelessWidget {
  const ProjectHero({Key? key, required this.hero}) : super(key: key);

  final AHero hero;

  @override
  Widget build(BuildContext context) {
    // Make a Hero with Title, Image, Description and Tag
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(hero.desc,
                            style: Theme.of(context).textTheme.bodyText2),
                        const SizedBox(height: 20),
                        Hero(
                          tag: hero.tag,
                          child: CachedNetworkImage(
                            imageUrl: hero.image,
                            placeholder: (context, url) => const SizedBox(
                              height: 400,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
