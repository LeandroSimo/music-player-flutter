import 'package:flutter/material.dart';
import 'package:player_app/src/app/model/playlist.dart';
import 'package:player_app/src/app/model/song.dart';

// Widgets
import 'package:player_app/src/app/view_models/custom_app_bar.dart';
import 'package:player_app/src/app/view_models/nav_bar.dart';
import 'package:player_app/src/app/view_models/discover_music.dart';
import 'package:player_app/src/app/view_models/playlist_card.dart';
import 'package:player_app/src/app/view_models/section_header.dart';
import 'package:player_app/src/app/view_models/trending_music.dart';

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
        drawer: const Drawer(),
        appBar: const CustomAppBar(),
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverMusic(),
              TrendingMusic(songs: songs),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SectionHeader(title: 'Playlists'),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: playlists.length,
                        itemBuilder: (context, index) {
                          return PlayListCard(playlist: playlists[index]);
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
