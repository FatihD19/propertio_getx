import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void confirmDialog(
    BuildContext context, String title, String message, Function() onConfirm) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: '$title',
    desc: '$message',
    btnCancelText: 'Batal',
    btnOkOnPress: () {
      onConfirm();
    },
    btnCancelOnPress: () {},
  )..show();
}

void errorDialog(BuildContext context, String message, String title,
    {Function()? onConfirm}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.scale,
    title: '$message',
    btnCancelText: 'Batal',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      onConfirm!();
    },
  ).show();
}
