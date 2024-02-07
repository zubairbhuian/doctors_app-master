import 'package:doctors_app/utils/const_color.dart';
import 'package:flutter/material.dart';

class AppIndecator extends StatelessWidget {
  final double? value;
  const AppIndecator({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color:ConstantsColor.primaryColor,
      value: value,
    );
  }
}
