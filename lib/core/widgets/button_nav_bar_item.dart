  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/color_app.dart';

BottomNavigationBarItem customButtonNavBarItem(
      {required ThemeData theme,
      required String imagePath,
      required String label}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          imagePath,
          colorFilter: ColorFilter.mode(
              theme.colorScheme.primaryContainer, BlendMode.srcIn),
        ),
        label: label,
        backgroundColor: ColorApp.transparentColor);
  }