import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_category_screen_item.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_tab_bar.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/browse/browse_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BrowseBody extends StatelessWidget {
  const BrowseBody({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var provider = Provider.of<MainProvider>(context);
    var cubit = BlocProvider.of<BrowseCubit>(context);
    return SafeArea(
        child: DefaultTabController(
      length: List.generate(
        cubit.genresMovie?.length ?? 0,
        (index) => Tab(
          text: cubit.genresMovie?[index].name,
        ),
      ).length,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomTabBar(
                  onTap: (value) async {
                    provider.customControlBrowseTap(value);
                    await cubit.getAllDataInGenresId(
                        categoryId: cubit
                                .genresMovie?[provider.initialIndexBrowsTap].id
                                .toString() ??
                            "");
                  },
                  tabs: List.generate(
                    cubit.genresMovie?.length ?? 0,
                    (index) => Tab(
                      text: cubit.genresMovie?[index].name,
                    ),
                  ),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                ),
                CustomCategoryScreenItem(),
              ].reversed.toList(),
            ),
          ],
        ),
      ),
    ));
  }
}
