import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/screen_body/movie_details_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});
  static const String routeName = kMovieView;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Never Let Go",
          style: theme.textTheme.titleMedium,
        ),
    
      ),
      body: MovieDetailsBody(),
    );
  }
}
