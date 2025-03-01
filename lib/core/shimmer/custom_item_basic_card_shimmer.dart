import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemBasicCardShimmer extends StatelessWidget {
  const CustomItemBasicCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 190,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(height: 8),
          Container(
            width: 130,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(height: 4),
          Container(
            width: 80,
            height: 14,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
          ),
        ],
      ),
    );
  }
}
