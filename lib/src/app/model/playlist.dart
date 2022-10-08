import 'package:player_app/src/app/model/song.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imgUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imgUrl,
  });

  static List<Playlist> playLists = [
    Playlist(
      title: 'Pagode',
      songs: Song.songs,
      imgUrl:
          'https://images.unsplash.com/photo-1598515750977-a1f11bfd66e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2FtYmF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    ),
    Playlist(
      title: 'Forró',
      songs: Song.songs,
      imgUrl:
          'https://images.unsplash.com/photo-1655770926081-66ec8decf028?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9yciVDMyVCM3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Playlist(
      title: 'Rock',
      songs: Song.songs,
      imgUrl:
          'https://images.unsplash.com/photo-1612120781563-844cbaeaeafb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHJvY2slMjBhbmQlMjByb2xsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Playlist(
      title: 'Sertanejo',
      songs: Song.songs,
      imgUrl:
          'https://images.unsplash.com/photo-1541689592655-f5f52825a3b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
  ];
}
