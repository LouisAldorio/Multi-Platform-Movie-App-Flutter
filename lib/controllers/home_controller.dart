// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:multi_platform_movie_app/models/movie.dart';
import 'package:multi_platform_movie_app/models/resource.dart';
import 'package:multi_platform_movie_app/repositories/movie_reporitory_impl.dart';
import 'package:multi_platform_movie_app/repositories/movie_repository.dart';

enum MovieType { popular, upcoming, now_playing }

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  MovieRepository repository = MovieRepositoryImpl();

  RxInt page = 1.obs;
  RxBool isLoadingPopular = false.obs;
  Rx<Resource<List<Movie>>> popularResult = Resource<List<Movie>>(
    data: [],
    metadata: null,
    error: null,
  ).obs;

  RxBool isLoadingNowPlaying = false.obs;
  Rx<Resource<List<Movie>>> nowPlayingResult = Resource<List<Movie>>(
    data: [],
    metadata: null,
    error: null,
  ).obs;

  @override
  void onInit() {
    getMovies(MovieType.popular);
    getMovies(MovieType.now_playing);
    super.onInit();
  }

  void getMovies(MovieType type) {
    if (type == MovieType.popular) {
      isLoadingPopular.value = true;
      repository.getMovies(page: page.value, type: type).then((value) {
        if (value.error != null) {
          popularResult.value.error = value.error;
        } else {
          popularResult.value.metadata = value.metadata;
          popularResult.value.data?.addAll(value.data!.map((e) => e));
        }

        isLoadingPopular.value = false;
      });
    } else if (type == MovieType.now_playing) {
      isLoadingNowPlaying.value = true;
      repository.getMovies(page: page.value, type: type).then((value) {
        
        if (value.error != null) {
          nowPlayingResult.value.error = value.error;
        } else {
          nowPlayingResult.value.metadata = value.metadata;
          nowPlayingResult.value.data?.addAll(value.data!.map((e) => e));
        }
        isLoadingNowPlaying.value = false;
      });
    }
  }

  void loadNextPage(MovieType type) {
    page += 1;
    getMovies(type);
  }
}
