import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualView extends StatelessWidget {
  VirtualView({super.key});

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(Uri.parse('https://virtualtour0001.propertio.id'));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
