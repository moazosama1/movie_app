import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_button_app.dart';

class CustomButtonBanner extends StatelessWidget {
  const CustomButtonBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: mediaQueryHeight * 0.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.4, 1],
          colors: [
            theme.colorScheme.surfaceContainerLow,
            theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.55),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButtonApp(
            title: "Play",
            color: theme.colorScheme.primary,
            icon: Icons.play_arrow_outlined,
            onTap: () {},
          ),
          CustomButtonApp(
            title: "Add to List",
            color: theme.colorScheme.secondary,
            icon: Icons.add,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

