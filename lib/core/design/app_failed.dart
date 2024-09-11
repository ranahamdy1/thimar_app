import 'package:flutter/cupertino.dart';

class AppFailed extends StatelessWidget {
  final String msg;
  const AppFailed({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Text(msg);
  }
}
