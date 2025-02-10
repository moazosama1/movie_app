class ApiUrl {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String listMoviesByGenresIdUrl = "discover/movie?with_genres=";
  static const String listTvShowByGenresIdUrl = "discover/tv?with_genres=";
  static const String imageUrl = "https://image.tmdb.org/t/p/original";
  static const String trendingByGenresUrl =
      "discover/movie?sort_by=popularity.desc&&vote_average.gte=8&with_genres=";
  static const String upcomingEndPointUrl =
      "movie/upcoming?language=en-US&page=1";
  static const String tpRatedEndPointUrl =
      "movie/top_rated?language=en-US&page=1";

  static const String genresMovieListEndPointUrl =
      "genre/movie/list?language=en";
  static const String genresTvShowTopRatedEndPointUrl =
      "tv/top_rated?language=en-US&page=1";

  static String? getImageFullPath({required String? imagePath}) {
    if (imagePath != null) {
      final String imageFullPath = "$imageUrl$imagePath";
      return imageFullPath;
    } else {
      return "";
    }
  }
}
