import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:player_app/src/app/widgets/musicplayer.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

// Song Model
import 'package:player_app/src/app/model/song.dart';

// Widget
import 'package:player_app/src/app/widgets/background_filter.dart';
import 'package:player_app/src/app/widgets/seekBar.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs.length;

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
            // tag: MediaItem(
            //   id: song.url,
            //   album: song.description,
            //   title: song.title,
            //   artUri: Uri.parse('asset:///${song.url}'),
            // ),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[1].url}'),
            // tag: MediaItem(
            //   id: Song.songs[1].url,
            //   album: song.description,
            //   title: song.title,
            //   artUri: Uri.parse('asset:///${Song.songs[1].url}'),
            // ),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[2].url}'),
            // tag: MediaItem(
            //   id: Song.songs[2].url,
            //   album: song.description,
            //   title: song.title,
            //   artUri: Uri.parse('asset:///${Song.songs[2].url}'),
            // ),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[3].url}'),
            // tag: MediaItem(
            //   id: Song.songs[3].url,
            //   album: song.description,
            //   title: song.title,
            //   artUri: Uri.parse('asset:///${Song.songs[3].url}'),
            // ),
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
    final song = ModalRoute.of(context)!.settings.arguments as Song;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          StreamBuilder<int?>(
              stream: audioPlayer.currentIndexStream,
              builder: (context, snapshot) {
                final currentIndex = snapshot.data;
                if (currentIndex != null) {
                  return Image.asset(
                    Song.songs[currentIndex].coverUrl,
                    fit: BoxFit.cover,
                  );
                }
                return const Text('');
              }),
          const BackgroundFilter(),
          MusicPlayer(
            song: song,
            seekBarDataStream: _seekBarDataStream,
            audioPlayer: audioPlayer,
          ),
        ],
      ),
    );
  }
}
