import 'package:astokholm/projects/project_view.dart';
import 'package:flutter/material.dart';

import 'homepage/home_page_view.dart';
import 'projects/heroes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Andreas Stokholm',
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
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
      },
    );
  }
}
