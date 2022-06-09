import 'package:multi_platform_movie_app/controllers/home_controller.dart';
import 'package:multi_platform_movie_app/models/resource.dart';

import '../services/movie_service.dart';

import '../models/movie.dart';
import './movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieService service;

  MovieRepositoryImpl({this.service = const MovieService()});

  @override
  Future<Resource<List<Movie>>> getMovies({required int page, required MovieType type}) {
    return service.getMovies(page, type);
  }
}
