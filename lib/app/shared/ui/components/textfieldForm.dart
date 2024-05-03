// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:propertio_getx/app/constants/theme.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  String? title;
  bool? mandatory;
  bool? isNumber;

  Function(String)? onChanged;
  Widget? prefix;
  Widget? suffix;

  CustomTextField(
      {this.controller,
      this.title,
      this.hintText,
      this.onChanged,
      this.suffix,
      this.prefix,
      this.isNumber = false,
      this.mandatory = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
              ? SizedBox()
              : mandatory == false
                  ? Text(
                      '$title',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    )
                  : RichText(
                      text: TextSpan(children: [
                      TextSpan(
                        text: title,
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      TextSpan(
                        text: ' *',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                          color: Colors.red,
                        ),
                      ),
                    ])),
          SizedBox(height: 5),
          Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(0xFF79747E),
                ),
              ),
              child: TextFormField(
                  controller: controller,
                  onChanged: (value) {
                    controller?.value = TextEditingValue(
                      text: value.replaceAll(',', '.'),
                      selection: TextSelection.collapsed(offset: value.length),
                    );
                    onChanged != null ? onChanged!(value) : null;
                  },
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: secondaryTextStyle,
                    border: InputBorder.none,
                    suffixIcon: suffix,
                    suffixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixIcon: prefix,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                  ),
                  inputFormatters: isNumber == true
                      ? <TextInputFormatter>[
                          CurrencyTextInputFormatter.currency(
                            decimalDigits: 0,
                            symbol: '',
                          )
                        ]
                      : null,
                  keyboardType: isNumber == true
                      ? TextInputType.number
                      : TextInputType.text)),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  String? hintText;
  TextEditingController? passontroller;
  PasswordField({this.passontroller, this.hintText, super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Kata Sandi*",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          // SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(0xFF79747E),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: widget.passontroller,
                      obscureText:
                          _obscureText, // Sesuai dengan kondisi _obscureText
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: '${widget.hintText}',
                        hintStyle: secondaryTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Mengubah nilai _obscureText saat tombol ditekan
                      });
                    },
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons
                              .visibility, // Mengganti ikon berdasarkan kondisi _obscureText
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
