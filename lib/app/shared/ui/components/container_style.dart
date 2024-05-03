import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: Offset(4, 4),
        blurRadius: 20,
        spreadRadius: 2,
      ),
    ],
  );
}
