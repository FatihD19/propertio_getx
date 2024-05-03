import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebviewtubeDemo extends StatefulWidget {
  final String urlVideo;
  WebviewtubeDemo(this.urlVideo, {Key? key}) : super(key: key);

  @override
  State<WebviewtubeDemo> createState() => _WebviewtubeDemoState();
}

class _WebviewtubeDemoState extends State<WebviewtubeDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: HtmlWidget(
          '<iframe width="100%" height="300" src="${widget.urlVideo}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
        )
        // Stack(
        //   children: [
        //     WebviewtubePlayer(
        //       videoId: widget.urlVideo,
        //       options: options,
        //       controller: controller,
        //     ),
        //     Positioned(
        //         bottom: 1,
        //         right: 1,
        //         child: GestureDetector(
        //           onTap: () async {
        //             await launchUrl(Uri.parse(
        //                 'https://www.youtube.com/watch?v=${widget.urlVideo}'));
        //           },
        //           child: Container(
        //             width: 80,
        //             height: 35,
        //             color: Colors.transparent,
        //           ),
        //         )),
        //   ],
        // ),
        );
  }

  void _launchYouTubeApp(String urlVideo) async {
    final url = 'https://www.youtube.com/watch?v=XzFB53H4XFc';
    await launchUrl(Uri.parse(url));
  }
}
//       child: WebviewtubeVideoPlayer(
//         videoId: 'qV6tIzYgnaM',
//         options: options,
//         controller: controller,
//       ),
//     );
//   }
// }
