import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  Color? color;
  bool? disable;

  CustomButton({
    this.color,
    required this.text,
    this.icon,
    required this.onPressed,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        onPressed: disable == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(120),
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: buttonTextColor),
                  SizedBox(width: 8),
                  Text(text,
                      style: buttonTextStyle.copyWith(
                          fontSize: 14, fontWeight: bold)),
                ],
              )
            : Text(text,
                style:
                    buttonTextStyle.copyWith(fontSize: 14, fontWeight: bold)),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String text;

  final String? img;
  final VoidCallback onPressed;

  const TransparentButton({
    required this.text,
    this.img,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.099),
                blurRadius: 1,
              ),
            ],
          ),
          width: 150,
          height: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              img != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(img!),
                        SizedBox(width: 8),
                        Text(text,
                            style: buttonTextStyle.copyWith(
                                fontSize: 12, fontWeight: bold)),
                      ],
                    )
                  : Text(text,
                      style: buttonTextStyle.copyWith(
                          fontSize: 12, fontWeight: bold)),
            ],
          )
          // child: ElevatedButton(
          //   onPressed: onPressed,
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.white.withOpacity(0.099),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(120),
          //     ),
          //   ),
          //   child: icon != null
          //       ? Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(icon, color: buttonTextColor),
          //             SizedBox(width: 8),
          //             Text(text,
          //                 style: buttonTextStyle.copyWith(
          //                     fontSize: 14, fontWeight: bold)),
          //           ],
          //         )
          //       : Text(text,
          //           style:
          //               buttonTextStyle.copyWith(fontSize: 14, fontWeight: bold)),
          // ),
          ),
    );
  }
}
