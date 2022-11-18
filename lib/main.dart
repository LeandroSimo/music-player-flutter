import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';

// import 'package:just_audio_background/just_audio_background.dart';

// Screens
import 'package:player_app/src/app/view/home_screen.dart';
import 'package:player_app/src/app/view/playlist_screen.dart';
import 'package:player_app/src/app/view/song.screen.dart';

// Future<void> main() async {
//   await JustAudioBackground.init(
//     androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
//     androidNotificationChannelName: 'Audio playback',
//     androidNotificationOngoing: true,
//   );
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const SongScreen()),
        GetPage(name: '/playlist', page: () => const PlayListScreen()),
      ],
    );
  }
}
