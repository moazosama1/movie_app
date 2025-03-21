import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_url.dart';
import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/auth/data/models/account_model/account_model.dart';

class CustomAccountInfo extends StatelessWidget {
  const CustomAccountInfo({super.key, required this.accountModel});
  final AccountModel? accountModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClipOval(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.surface,
                width: 2.0,
              ),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: ApiUrl.getImageFullPath(
                    imagePath: accountModel?.avatar?.tmdb?.avatarPath)!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(ImagePath.errorImage),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          accountModel?.name ?? accountModel?.username ?? "",
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
