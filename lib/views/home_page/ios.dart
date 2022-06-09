import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_platform_movie_app/controllers/home_controller.dart';

class HomeIOSView extends GetView<HomeController> {
  const HomeIOSView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Multi-platform Movie App'),
      ),
      child: Center(
        child: Text('iOS'),
      ),
    );
  }
}
