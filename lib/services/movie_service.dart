import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multi_platform_movie_app/controllers/home_controller.dart';
import 'package:multi_platform_movie_app/models/resource.dart';
import '../models/movie.dart';

class MovieService {
  const MovieService();

  Future<Resource<List<Movie>>> getMovies(int page, MovieType type) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjIwOWM1ZjJhZjMwZjc0MjZmNGU4NzRmNGQ1NjIxMiIsInN1YiI6IjVkYzRmNDY1YWIxYmM3MDAxM2ZlNDA4OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EnpkajfHJW0khwqwGEGfLrkm8PCL9O2gyx7MuXZdHyU',
    };
    http.Response response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/${type.name.toString()}/?page=$page'),
        headers: headers);

    if (jsonDecode(response.body)['status_message'] == null) {
      return Resource(
        data: (jsonDecode(response.body)['results'] as List<dynamic>)
            .map((e) => Movie.fromJson(e))
            .toList(),
        error: null,
        metadata: Metadata(
          totalPages: jsonDecode(response.body)['total_pages'],
          currentPage: jsonDecode(response.body)['page'],
          total: jsonDecode(response.body)['total_results'],
        ),
      );
    }

    return Resource(
      data: null,
      error: Error(message: jsonDecode(response.body)['status_message']),
      metadata: null,
    );
  }
}
