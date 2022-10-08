import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Screens
import 'package:player_app/src/app/view/home_screen.dart';
import 'package:player_app/src/app/view/playlist_screen.dart';
import 'package:player_app/src/app/view/song.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Player App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: const SongScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const SongScreen()),
        GetPage(name: '/playlist', page: () => const PlayListScreen()),
      ],
    );
  }
}
