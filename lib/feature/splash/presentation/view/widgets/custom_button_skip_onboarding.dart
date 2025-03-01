import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonSkipOnboarding extends StatelessWidget {
   CustomButtonSkipOnboarding({
    super.key,
    this.onTap
  });
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 30,
          width: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15)),
              color: theme.colorScheme.surface.withValues(alpha: 0.2)),
          child: Center(
              child: Text(
            "Skip",
            style: theme.textTheme.labelMedium,
          )),
        ),
      ),
    );
  }
}
