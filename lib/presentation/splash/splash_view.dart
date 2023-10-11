

import 'dart:async';

import 'package:cocktail/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startTimer(){
    _timer = Timer( const Duration(seconds: 2), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.categoriesListRoute);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(ImageAssets.splashLogo),),
    );
  }
}
