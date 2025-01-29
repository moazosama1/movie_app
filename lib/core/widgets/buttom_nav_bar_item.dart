  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/color_app.dart';

BottomNavigationBarItem customButtomNavBarItem(
      {required ThemeData theme,
      required String imagePath,
      required String lable}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          imagePath,
          colorFilter: ColorFilter.mode(
              theme.colorScheme.primaryContainer, BlendMode.srcIn),
        ),
        label: lable,
        backgroundColor: ColorApp.transparentColor);
  }