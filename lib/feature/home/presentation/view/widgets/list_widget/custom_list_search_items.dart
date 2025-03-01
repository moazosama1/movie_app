import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/preview_item_model/preview_item_model.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/card_widget/custom_movie_card.dart';

class CustomListSearchItems extends StatelessWidget {
  const CustomListSearchItems({
    super.key, this.multiSearch,
  });
final List<PreviewItemModel>? multiSearch;
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
          itemCount: multiSearch?.length ?? 0,
          itemBuilder: (context, index) => Center(
                child: CustomMovieBasicCard(
                  previewItemModel: multiSearch?[index],
                ),
              )),
    );
  }
}
