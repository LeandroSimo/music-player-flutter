class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'Dois Rivais',
      description: 'Dois Rivais',
      url: 'assets/music/dois_rivais_pericles.mp3',
      coverUrl: 'assets/images/pericles.jpg',
    ),
    Song(
      title: 'Ela não vai voltar',
      description: 'Ela não vai voltar',
      url: 'assets/music/ela_nao_vai_voltar_joao_gomes.mp3',
      coverUrl: 'assets/images/ela_nao_vai_voltar_joao_gomes.jpg',
    ),
    Song(
      title: 'Melhor eu ir',
      description: 'Melhor eu ir',
      url: 'assets/music/dois_rivais_pericles.mp3',
      coverUrl: 'assets/images/melhor_eu_ir.jpg',
    ),
    Song(
      title: 'Gostosinha é ela',
      description: 'É na pegada do vianna',
      url: 'assets/music/na_pegada_do_viana.mp3',
      coverUrl: 'assets/images/na_pegada_do_viana.webp',
    ),
  ];
}
