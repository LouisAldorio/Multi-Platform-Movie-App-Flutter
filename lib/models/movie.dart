class Movie {
  final int id;
  final String? title;
  final String? posterPath;
  final String? releaseDate;
  final String? overview;
  final double? voteAverage;

  String get poster {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return "";
  }

  const Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
  });

  factory Movie.fromJson(json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      voteAverage: double.tryParse(json['vote_average'].toString()),
    );
  }
}
