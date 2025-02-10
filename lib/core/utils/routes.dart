import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/home_view.dart';
import 'package:movie_app/feature/home/presentation/view/more_movie_view.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/browse/browse_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/tv_list/tv_list_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:movie_app/feature/splash/presentation/view/splash_view.dart';
import 'package:provider/provider.dart';

abstract class AppRoutes {
  static Map<String, WidgetBuilder> appRoute = {
    SplashView.routeName: (_) => SplashView(),
    HomeView.routeName: (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MainProvider()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MovieListCubit()..getAllMoviesData(),
              ),
              BlocProvider(
                create: (context) => TvListCubit()..getTvAllData(),
              ),
              BlocProvider(
                lazy: false,
                create: (context) => BrowseCubit()..getAllData(),
              ),
            ],
            child: HomeView(),
          ),
        ),
    MovieDetailsView.routeName: (_) => MovieDetailsView(),
    MoreMovieView.routeName: (_) => MoreMovieView(),
  };
}
