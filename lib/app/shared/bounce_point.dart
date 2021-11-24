import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
 
class BouncePoint extends StatelessWidget {
  final bool? state;
  final double size;
  final Color? color;

  const BouncePoint({
    Key? key,
    this.state,
    this.size = 64,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case true:
        return SpinKitThreeBounce(
          size: size,
          color: color ?? AppTheme.secondaryBackColor, //.withOpacity(.5),
          duration: AppConstant.durationSplash,
        );
      case false:
        return SpinKitCubeGrid(
          size: size,
          color: color ?? AppTheme.secondaryBackColor, //.withOpacity(.5),
          duration: AppConstant.durationSplash,
        );
      default:
        return SpinKitSquareCircle(
          size: size,
          color: color ?? AppTheme.secondaryBackColor, //.withOpacity(.5),
          duration: AppConstant.durationSplash,
        );
    }
  }
}
