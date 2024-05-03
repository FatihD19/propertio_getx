import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class TextFailure extends StatelessWidget {
  const TextFailure({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: secondaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
      ),
    );
  }
}
