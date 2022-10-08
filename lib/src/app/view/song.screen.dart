import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:player_app/src/app/view_models/musicplyer.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

// Song Model
import 'package:player_app/src/app/model/song.dart';

// Widget
import 'package:player_app/src/app/view_models/background_filter.dart';
import 'package:player_app/src/app/view_models/seekBar.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Song.songs[0];

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        (Duration position, Duration? duration) {
          return SeekBarData(position, duration ?? Duration.zero);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
          ),
          const BackgroundFilter(),
          MusicPlayer(
            seekBarDataStream: _seekBarDataStream,
            audioPlayer: audioPlayer,
          ),
        ],
      ),
    );
  }
}
