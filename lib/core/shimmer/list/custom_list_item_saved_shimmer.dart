import 'package:flutter/material.dart';
import 'package:movie_app/core/shimmer/custom_card_horizontal_shimmer.dart';

class CustomListItemSavedShimmer extends StatelessWidget {
  const CustomListItemSavedShimmer({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return SizedBox(
            height: 140,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CustomCardHorizontalShimmer(),
            ),
          );
        },
        childCount: count,
      ),
    );
  }
}
