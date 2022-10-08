import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// Widget
import 'package:player_app/src/app/view_models/player_buttons.dart';

// Model
import 'package:player_app/src/app/view_models/seekBar.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    Key? key,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  })  : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

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
          PlayerButtons(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}
