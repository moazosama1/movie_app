class ApiUrl {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String listMoviesByGenresIdUrl = "discover/movie?with_genres=";
  static const String listTvShowByGenresIdUrl = "discover/tv?with_genres=";
  static const String imageUrl = "https://image.tmdb.org/t/p/w500";
  static const String trendingByGenresUrl =
      "discover/movie?sort_by=popularity.desc&&vote_average.gte=8&with_genres=";
  static const String upcomingEndPointUrl =
      "movie/upcoming?language=en-US&page=1";
  static const String tpRatedMovieEndPointUrl =
      "movie/top_rated?language=en-US&page=1";
  static const String popularMovieEndPointUrl =
      "movie/popular?language=en-US&page=1";
  static const String nowPlayingEndPointUrl =
      "movie/now_playing?language=en-US&page=1";

  static const String genresMovieListEndPointUrl =
      "genre/movie/list?language=en";
  static const String genresTvShowTopRatedEndPointUrl =
      "tv/top_rated?language=en-US&page=1";
  static const String tvShowTrendingEndPointUrl =
      "trending/tv/day?language=en-US";
  static const String tvShowAiringTodayEndPointUrl =
      "tv/airing_today?language=en-US&page=1";
  static const String requestTokenEndPointUrl = "authentication/token/new";
  static const String sessionIdEndPointUrl = "authentication/session/new";
  static const String userPermissionPointUrl =
      "https://www.themoviedb.org/authenticate/";
  static const String getAccountEndPointUrl = "account?session_id=";
  static const String getAccountInfoEndPointUrl = "account/";

  static String? getImageFullPath({required String? imagePath}) {
    if (imagePath != null) {
      final String imageFullPath = "$imageUrl$imagePath";
      return imageFullPath;
    } else {
      return "";
    }
  }
}
