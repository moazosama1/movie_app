import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/auth/presentation/view/auth_view.dart';
import 'package:movie_app/feature/auth/presentation/view_model/cubit/auth_cubit_cubit.dart';
import 'package:movie_app/feature/home/presentation/view/home_view.dart';
import 'package:movie_app/feature/home/presentation/view/more_movie_view.dart';
import 'package:movie_app/feature/home/presentation/view/movie_details_view.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/browse/browse_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/saved_item/saved_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/for_you_list/for_you_list_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_list/movie_list_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/search/search_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/tv_list/tv_list_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/account_info/account_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:movie_app/feature/splash/presentation/view/onboarding_view.dart';
import 'package:movie_app/feature/splash/presentation/view/splash_view.dart';
import 'package:movie_app/feature/splash/presentation/view_model/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

abstract class AppRoutes {
  static Map<String, WidgetBuilder> appRoute = {
    SplashView.routeName: (_) => SplashView(),
    OnboardingView.routeName: (_) => ChangeNotifierProvider(
        create: (_) => OnboardingProvider(), child: OnboardingView()),
    HomeView.routeName: (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MainProvider()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ForYouListCubit()..getAllDataForYou(),
              ),
              BlocProvider(
                create: (context) => TvListCubit()..getTvAllData(),
              ),
              BlocProvider(
                create: (context) => MovieListCubit()..getAllMoviesData(),
              ),
              BlocProvider(
                lazy: false,
                create: (context) => BrowseCubit()..getAllData(),
              ),
              BlocProvider(
                create: (context) => AccountCubit()..getAccountInfo(),
              ),
              BlocProvider(
                create: (context) => SavedCubit(),
              ),
              BlocProvider(
                create: (context) => SearchCubit(),
              )
            ],
            child: HomeView(),
          ),
        ),
    MovieDetailsView.routeName: (_) => MultiProvider(
        providers: [
        BlocProvider.value(value: AccountCubit()),
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ],
        child: MovieDetailsView(),
      ),
    MoreMovieView.routeName: (_) => MoreMovieView(),
    AuthView.routeName: (_) => BlocProvider(
          create: (context) => AuthCubit(),
          child: AuthView(),
        ),
  };
}
