import 'package:multi_platform_movie_app/controllers/home_controller.dart';
import 'package:multi_platform_movie_app/models/resource.dart';

import '../models/movie.dart';

abstract class MovieRepository {
  Future<Resource<List<Movie>>> getMovies({required int page, required MovieType type});
}