import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double? height, width;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;
  const AppImage(this.url, {super.key, this.height, this.width, this.fit = BoxFit.scaleDown, this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    if(url.startsWith("http")) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(
          url,
          height: height?.h,
          width: width?.w,
          fit: fit,
          errorBuilder: (context, error, stackTrace)=> const Text("error.http"),
        ),
      );
    }else if (url.endsWith("svg")){
      return ClipRRect(
        borderRadius: borderRadius,
        child: SvgPicture.asset(
          url,
          height: height?.h,
          width: width?.w,
          fit: fit,
        ),
      );
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        url,
        height: height?.h,
        width: width?.w,
        fit: fit,
        errorBuilder: (context, error, stackTrace)=> const Text("error.png"),
      ),
    );
  }
}
