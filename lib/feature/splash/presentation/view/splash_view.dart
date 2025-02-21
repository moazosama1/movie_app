import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_app/feature/auth/presentation/view/auth_view.dart';
import 'package:movie_app/feature/home/presentation/view/home_view.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});
  static const String routeName = kSplashView;
  final AuthRepo authRepo = AuthRepoImpel();

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () async {
        final String? sessionId = await widget.authRepo.getSessionId();
        if (sessionId != null) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.routeName,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AuthView.routeName,
            (route) => false,
          );
        }
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
