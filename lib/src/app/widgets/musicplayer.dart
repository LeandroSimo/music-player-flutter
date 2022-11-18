import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// Widget
import 'package:player_app/src/app/widgets/player_buttons.dart';

// Model
import 'package:player_app/src/app/widgets/seekBar.dart';
import 'package:player_app/src/app/model/song.dart';

class MusicPlayer extends StatelessWidget {
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;
  final Song song;

  const MusicPlayer({
    Key? key,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
    required this.song,
  })  : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<int?>(
              stream: audioPlayer.currentIndexStream,
              builder: (context, snapshot) {
                final currentIndex = snapshot.data;
                if (currentIndex != null) {
                  return Center(
                    child: Text(
                      Song.songs[currentIndex].title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  );
                  ;
                }
                return const Text('');
              }),
          const SizedBox(height: 10),
          StreamBuilder<int?>(
              stream: audioPlayer.currentIndexStream,
              builder: (context, snapshot) {
                final currentIndex = snapshot.data;
                if (currentIndex != null) {
                  return Center(
                    child: Text(
                      Song.songs[currentIndex].description,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  );
                }
                return const Text('');
              }),
          const SizedBox(height: 30),
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChanged: audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 35,
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 35,
                icon: const Icon(
                  Icons.cloud_download,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
