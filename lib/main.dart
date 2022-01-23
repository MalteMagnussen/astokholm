import 'package:astokholm/projects/home_page_heroes.dart';
import 'package:astokholm/projects/project_view.dart';
import 'package:astokholm/publications/publications_view.dart';
import 'package:flutter/material.dart';

import 'homepage/home_page_view.dart';
import 'projects/heroes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Andreas Stokholm'),
                centerTitle: true,
                // Smaller tabbar
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Projects'),
                    Tab(text: 'Publications'),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      themeNotifier.value == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: themeNotifier.value == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        themeNotifier.value =
                            themeNotifier.value == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                      });
                    },
                  )
                ],
              ),
              body: const TabBarView(
                children: [
                  HomePageView(),
                  ProjectsView(),
                  PublicationsView(),
                ],
              ),
            ),
          ),
          routes: {
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
