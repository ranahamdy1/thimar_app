import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  const AppButton({super.key, this.text="", this.onPress});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: onPress, child: Text(text));
  }
}
