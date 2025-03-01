import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomWidgetLoading extends StatelessWidget {
  const CustomWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: mediaQueryHeight,
        child: SpinKitFadingCube(
          color: theme.colorScheme.primary,
          size: 50.0,
        ),
      ),
    );
    ;
  }
}
