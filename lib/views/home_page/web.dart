import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_platform_movie_app/controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeWebView extends GetView<HomeController> {
  const HomeWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-platform Movie App'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: 450),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          // GridView.count(
          //   primary: false,
          //   padding: const EdgeInsets.all(20),
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   crossAxisCount: 10,
          //   children: <Widget>[
          //     Container(
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[100],
          //       child: const Text("He'd have you all unravel at the"),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[200],
          //       child: const Text('Heed not the rabble'),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[300],
          //       child: const Text('Sound of screams but the'),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[400],
          //       child: const Text('Who scream'),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[500],
          //       child: const Text('Revolution is coming...'),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.all(8),
          //       color: Colors.teal[600],
          //       child: const Text('Revolution, they...'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
