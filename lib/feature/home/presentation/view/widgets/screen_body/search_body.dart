import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/function/custom_function.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/custom_text_filed.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';
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
                  return Column(
                    children: [
                      SizedBox(
                        height: mediaQueryHeight * 0.2,
                      ),
                      SizedBox(
                        height: mediaQueryHeight * 0.3,
                        child: Center(
                          child: Image.asset(
                            height: mediaQueryHeight * .25,
                            fit: BoxFit.scaleDown,
                            ImagePath.searchResultImage,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  );
                case SearchSuccess():
                  return Expanded(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: state.multiSearch?.length ?? 0,
                        itemBuilder: (context, index) => Center(
                              child: CustomMovieBasicCard(
                                previewItemModel: state.multiSearch?[index],
                              ),
                            )),
                  );
                case SearchLoading():
                  return Center(
                    child: SizedBox(
                      height: 230,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
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
