// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:propertio_getx/app/shared/ui/components/container_style.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class DescriptionView extends StatefulWidget {
  final String description;
  const DescriptionView({required this.description, Key? key})
      : super(key: key);
  @override
  _DescriptionViewState createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  bool isExpanded = false;
  // double _widgetHeight = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // Dapatkan tinggi dari HtmlWidget setelah render selesai
  //     final RenderBox renderBox = context.findRenderObject() as RenderBox;
  //     setState(() {
  //       _widgetHeight = renderBox.size.height;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isExpanded
            ? Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                decoration: customBoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Deskripsi ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HtmlWidget(
                      widget.description,
                      textStyle: TextStyle(fontSize: 16.0),
                      // buildAsync: true,
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                          isExpanded
                              ? 'Tampilkan Lebih  Sedikit'
                              : 'Tampilkan Lebih',
                          style: thirdTextStyle),
                    ),
                  ],
                ),
              )
            : Container(
                height: 140,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                decoration: customBoxDecoration(),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      'Deskripsi ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HtmlWidget(
                      widget.description,
                      textStyle: TextStyle(fontSize: 16.0),
                      // buildAsync: true,
                    ),
                  ],
                ),
              ),
        isExpanded
            ? Container()
            : Positioned(
                top: 110,
                left: 16,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                      isExpanded
                          ? 'Tampilkan Lebih  Sedikit'
                          : 'Tampilkan Lebih',
                      style: thirdTextStyle),
                ),
              ),
      ],
    );
  }
}

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(
        //           'Deskripsi',
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         SizedBox(height: 8)
        //       ],
        //     ),
            // ExpandableText(
            //   onExpandedChanged: (value) {
            //     setState(() {
            //       isExpanded = !isExpanded;
            //     });
            //   },
            //   '${widget.description}',
            //   style: primaryTextStyle,
            //   maxLines: 3,
            //   expandText: 'Tampilkan lebih',
            //   collapseText: 'Tampilkan lebih sedikit',
            //   linkColor: primaryColor,
            //   textAlign: TextAlign.justify,
            // ),
        //     HtmlWidget(
        //       widget.description,
        //     )
        //     // Text(
        //     //   widget.description,
        //     //   style: primaryTextStyle,
        //     //   maxLines: isExpanded ? null : 3,
        //     //   overflow: isExpanded ? null : TextOverflow.ellipsis,
        //     // ),
        //   ],
        // ),