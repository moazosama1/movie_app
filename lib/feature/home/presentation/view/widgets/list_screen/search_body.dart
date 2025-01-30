import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 300,
            height: 400,
            color: color,
          ),
        ),
      ],
    );
  }
}
