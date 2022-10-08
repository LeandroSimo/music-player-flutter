import 'package:flutter/material.dart';

// Model
import 'package:player_app/src/app/model/playlist.dart';

// Widget
import 'package:player_app/src/app/view_models/playlist_card.dart';
import 'package:player_app/src/app/view_models/section_header.dart';

class PlayListMusic extends StatelessWidget {
  const PlayListMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
