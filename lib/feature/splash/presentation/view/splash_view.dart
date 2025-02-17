import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/presentation/view/home_view.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/for_you_list/for_you_list_cubit.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = kSplashView;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeView.routeName,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(),
    );
  }
}
