import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
    );
  }
}
