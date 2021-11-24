import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/shared/bounce_point.dart';

class ImageNetwork extends StatelessWidget {
  final String image;
  final BoxFit fit;
  const ImageNetwork({Key? key, required this.image, this.fit = BoxFit.contain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit,
        progressIndicatorBuilder: (context, url, progress) {
          return BouncePoint(size: 30);
        },
        errorWidget: (context, url, error) {
          return Icon(
            CupertinoIcons.xmark_circle_fill,
            color: AppTheme.mainIconColor,
          );
        },
      ),
    );
  }
}
