import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_platform_movie_app/controllers/home_controller.dart';
import 'package:multi_platform_movie_app/widgets/loader.dart';

class HomeAndroidView extends GetView<HomeController> {
  HomeAndroidView({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-platform Movie App'),
      ),
      body: Obx(
        () {
          return Container(
            child: controller.isLoadingPopular.value &&
                    controller.popularResult.value.data!.isEmpty
                ? const Loading()
                : controller.popularResult.value.error != null ||
                        controller.popularResult.value.data!.isEmpty
                    ? Text(controller.popularResult.value.error!.message
                        .toString())
                    : NotificationListener(
                        onNotification: (dynamic t) {
                          if (t is ScrollEndNotification &&
                              scrollController.position.pixels >=
                                  scrollController.position.maxScrollExtent *
                                      0.8 &&
                              !controller.isLoadingPopular.value &&
                              controller.page.value <
                                  controller
                                      .popularResult.value.metadata!.totalPages!
                                      .toInt()) {
                            controller.loadNextPage(MovieType.popular);
                          }
                          return true;
                        },
                        child: Builder(
                          builder: (context) => ListView.builder(
                            controller: scrollController,
                            itemCount: controller.page.value <
                                    controller.popularResult.value.metadata!
                                        .totalPages!
                                        .toInt()
                                ? controller.popularResult.value.data!.length +
                                    1
                                : controller.popularResult.value.data!.length,
                            itemBuilder: (context, index) {
                              if (index ==
                                      controller
                                          .popularResult.value.data!.length &&
                                  controller.page.value <=
                                      controller.popularResult.value.metadata!
                                          .totalPages!
                                          .toInt()) {
                                return const Loading();
                              }

                              final movie =
                                  controller.popularResult.value.data![index];
                              return ListTile(
                                title: Text(movie.title ?? '-'),
                                subtitle: Text(
                                    "${movie.releaseDate ?? '-'} | ${movie.voteAverage ?? '-'}"),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(movie.poster),
                                  backgroundColor: Colors.transparent,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
