import 'package:astokholm/project_hero.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'heroes.dart';

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
      theme: ThemeData.dark(), // TODO - add button to change theme
      // https://docs.flutter.dev/cookbook/design/themes
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const MyHomePage(title: 'Andreas Stokholm - CV and Portfolio'),
        sar.tag: (context) => ProjectHero(hero: sar),
        gan.tag: (context) => ProjectHero(hero: gan),
        ai4.tag: (context) => ProjectHero(hero: ai4),
        sentinel.tag: (context) => ProjectHero(hero: sentinel),
        student.tag: (context) => ProjectHero(hero: student),
      },
    );
  }
}
