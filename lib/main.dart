import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/core/utils/routes.dart';
import 'package:movie_app/core/utils/theme_app.dart';
import 'package:movie_app/feature/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeDark,
      routes: AppRoutes.appRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
