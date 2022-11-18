import 'package:flutter/material.dart';

// Model
import 'package:player_app/src/app/model/playlist.dart';

// Widget
import 'package:player_app/src/app/widgets/play_or_shuffle_switch.dart';
import 'package:player_app/src/app/widgets/playlist_songs.dart';
import 'package:player_app/src/app/widgets/playpist_information.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Playlist playlist = Playlist.playLists[0];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff620d1d).withOpacity(0.8),
            const Color(0xffc86b6f).withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Playlist'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                PlayListInformation(playlist: playlist),
                const SizedBox(height: 30),
                const PlayOrShuffleSwitch(),
                PlayListSongs(playlist: playlist)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
