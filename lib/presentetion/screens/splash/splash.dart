import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: ColorsManager.white,
            child: Image.asset(
              AssetsManager.splashPattern,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              AssetsManager.splashLogo,
              width: 199.w,
              height: 208.h,
            ),
            const Spacer(),
            Image.asset(
              AssetsManager.splashText,
              width: 213.w,
              height: 128.h,
            ),
          ],
        )
      ],
    );
  }
}
