import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/theme_app.dart';
import 'package:movie_app/feature/home/presentation/view/home_view.dart';
import 'package:movie_app/feature/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeDark,
      routes: {
        SplashView.routeName: (_) => SplashView(),
        HomeView.routeName: (_) => HomeView(),
      },
      initialRoute: SplashView.routeName,
    );
  }
}
