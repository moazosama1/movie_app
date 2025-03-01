import 'package:flutter/material.dart';
import 'package:movie_app/core/shimmer/custom_item_basic_card_shimmer.dart';

class CustomListItemSearchShimmer extends StatelessWidget {
  const CustomListItemSearchShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) => Center(
                child: CustomItemBasicCardShimmer(),
              )),
    );
  }
}

