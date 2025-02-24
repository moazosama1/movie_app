import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/movie_details/movie_details_cubit.dart';

class MoreMovieBody extends StatelessWidget {
  const MoreMovieBody({
    super.key,
    this.previewItemModel,
  });
  final List<PreviewItemModel>? previewItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2 / 3,
                  crossAxisSpacing: 8),
              itemCount: previewItemModel?.length ?? 0,
              itemBuilder: (context, index) => Center(
                child: BlocProvider(
                  create: (context) => MovieDetailsCubit(),
                  child: CustomMovieBasicCard(
                    previewItemModel: previewItemModel?[index],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
