import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/function/custom_favorite_function.dart';
import 'package:movie_app/core/widgets/custom_button_app.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/account_info/account_cubit.dart';

// ignore: must_be_immutable
class CustomButtonDetailsMovie extends StatelessWidget {
  CustomButtonDetailsMovie(
      {super.key,
      this.mainAxisAlignment,
      required this.title,
      this.onTapDetails,
      this.onTapAddToFavorite,
      required this.previewItemModel,
      required this.iconTitle});
  final MainAxisAlignment? mainAxisAlignment;
  final String title;
  final IconData iconTitle;
  void Function()? onTapDetails;
  void Function()? onTapAddToFavorite;
  PreviewItemModel? previewItemModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var cubitWatched = BlocProvider.of<AccountCubit>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
      children: [
        CustomButtonApp(
          title: title,
          color: theme.colorScheme.primary,
          icon: iconTitle,
          onTap: onTapDetails,
        ),
        BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            return CustomButtonApp(
              title: "Add to List",
              color: theme.colorScheme.secondary,
              icon: Icons.add,
              isLoading: state is AccountLoading ? true : false,
              onTap: () async {
                await cubitWatched.addItemsToFavorite(
                    addFavoriteModel: previewItemModel?.firstAirDate == null
                        ? CustomFavoriteFunction.addMovieItem(
                            movieId: previewItemModel?.id ?? 0)
                        : CustomFavoriteFunction.addTvShoeItem(
                            tvId: previewItemModel?.id ?? 0));
              },
            );
          },
        ),
      ],
    );
  }
}
