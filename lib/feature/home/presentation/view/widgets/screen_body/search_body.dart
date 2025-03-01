import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/shimmer/list/custom_list_item_search_shimmer.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_initial_screen.dart';
import 'package:movie_app/core/widgets/custom_text_filed.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/list_widget/custom_list_search_items.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/search/search_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<SearchCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find Movies, Tv series,\nand more..",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFiledSearch(
            onChange: cubit.searchMultiItem,
          ),
          SizedBox(
            height: 16,
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              switch (state) {
                case SearchInitial():
                  return CustomInitialScreen(
                    imagePath: ImagePath.searchResultImage,
                  );
                case SearchSuccess():
                  if (cubit.multiSearch!.isEmpty) {
                    return CustomInitialScreen(
                      imagePath: ImagePath.searchResultImage,
                    );
                  }
                  return CustomListSearchItems(
                    multiSearch: state.multiSearch,
                  );
                case SearchLoading():
                  return CustomListItemSearchShimmer();
                case SearchFailure():
                  return CustomErrorWidget(
                    errorMessage: state.errorMessage,
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
