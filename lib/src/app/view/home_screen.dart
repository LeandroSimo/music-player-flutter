import 'package:flutter/material.dart';
import 'package:player_app/src/app/model/playlist.dart';
import 'package:player_app/src/app/model/song.dart';

// Widgets
import 'package:player_app/src/app/widgets/custom_app_bar.dart';
import 'package:player_app/src/app/widgets/nav_bar.dart';
import 'package:player_app/src/app/widgets/discover_music.dart';
import 'package:player_app/src/app/widgets/playlist_music.dart';
import 'package:player_app/src/app/widgets/trending_music.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = Song.songs;
    final List<Playlist> playlists = Playlist.playLists;
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
        drawer: Drawer(
          backgroundColor: const Color(0xffc86b6f).withOpacity(0.8),
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        appBar: const CustomAppBar(),
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverMusic(),
              TrendingMusic(songs: songs),
              PlayListMusic(playlists: playlists)
            ],
          ),
        ),
      ),
    );
  }
}
