import 'package:flutter/material.dart';

class CustomInitialScreen extends StatelessWidget {
  const CustomInitialScreen({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaQueryHeight * 0.2,
            ),
            SizedBox(
              height: mediaQueryHeight * 0.3,
              child: Center(
                child: SizedBox(
                  height: mediaQueryHeight * .25,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.scaleDown,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
