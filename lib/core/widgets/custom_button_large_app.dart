import 'package:flutter/material.dart';

class CustomButtonLargeApp extends StatelessWidget {
  const CustomButtonLargeApp(
      {super.key, this.onTap, this.title, this.color, this.isLoading = false});
  final bool isLoading;
  final void Function()? onTap;
  final String? title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color ?? theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: !isLoading
                ? Text(
                    title ?? "",
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : CircularProgressIndicator(
                    color: theme.colorScheme.surface,
                  )),
      ),
    );
  }
}
