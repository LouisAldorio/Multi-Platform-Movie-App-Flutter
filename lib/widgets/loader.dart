import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multi_platform_movie_app/utils/platform.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: PlatformUtils.isAndroid() ? Theme.of(context).colorScheme.primary : CupertinoTheme.of(context).primaryColor,
        size: 50.0,
      ),
    );
  }
}
