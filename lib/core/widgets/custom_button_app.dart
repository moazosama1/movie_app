import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonApp extends StatelessWidget {
  CustomButtonApp(
      {super.key,
      required this.color,
      required this.title,
      required this.icon,
      this.isLoading = false,
      this.onTap});
  final bool isLoading;
  final Color color;
  final String title;
  final IconData icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Icon(
              icon,
              color: theme.colorScheme.surface,
            ),
            !isLoading
                ? Text(
                    title,
                    style: TextStyle(
                        fontSize: 15, color: theme.colorScheme.surface),
                  )
                : SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.surface,
                      strokeWidth: 3,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
