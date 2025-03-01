import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/button_nav_bar_item.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/core/widgets/list_screen.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/browse/browse_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/saved_item/saved_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = kHomeView;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = BlocProvider.of<BrowseCubit>(context);
    var cubitSaved = BlocProvider.of<SavedCubit>(context);
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: Consumer<MainProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: screen[provider.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) async {
                provider.customControlHomePage(value);
                if (value == 3) {
                  await cubitSaved.getWatchAllData();
                }
                if (value < 2) {
                  await cubit.getAllData();
                }
              },
              currentIndex: provider.currentIndex,
              items: [
                customButtonNavBarItem(
                    theme: theme, imagePath: ImagePath.homeIcon, label: "HOME"),
                customButtonNavBarItem(
                    theme: theme,
                    imagePath: ImagePath.browseIcon,
                    label: "BROWSE"),
                customButtonNavBarItem(
                    theme: theme,
                    imagePath: ImagePath.searchIcon,
                    label: "SEARCH"),
                customButtonNavBarItem(
                    theme: theme,
                    imagePath: ImagePath.bookMarkIcon,
                    label: "WATCH-LIST"),
              ],
            ),
          );
        },
      ),
    );
  }
}
