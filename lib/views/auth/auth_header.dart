import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';

class AuthHeaderScreen extends StatelessWidget {
  const AuthHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppImage("assets/images/logo2.png",
            height: 125, width: 130),
        const Text("مرحبا بك مرة أخرى"),
        SizedBox(height: 12.h),
        const Text("يمكنك تسجيل الدخول الأن"),
      ],
    );
  }
}
