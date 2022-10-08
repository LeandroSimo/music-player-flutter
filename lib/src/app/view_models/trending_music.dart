import 'package:flutter/material.dart';

// Widgets
import 'package:player_app/src/app/model/song.dart';
import 'package:player_app/src/app/view_models/section_header.dart';
import 'package:player_app/src/app/view_models/song_card.dart';

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionHeader(title: 'Músicas em alta'),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return SongCard(song: songs[index]);
                }),
          )
        ],
      ),
    );
  }
}
