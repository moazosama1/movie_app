class CustomFunction {
  static String? gitReleaseDate({required String? releaseDate}) {
    if (releaseDate!.length >= 4) {
      String processReleaseDate = releaseDate.substring(0, 4);
      return processReleaseDate;
    } else {
      return "";
    }
  }
}
