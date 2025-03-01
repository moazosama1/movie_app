import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAccountInfoShimmer extends StatelessWidget {
  const CustomAccountInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 20,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
