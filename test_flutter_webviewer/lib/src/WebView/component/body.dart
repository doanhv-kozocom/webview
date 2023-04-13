import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  final String? urlHelpo;
  final String? emailHelpo;
  const Body({
    Key? key,
    this.urlHelpo,
    this.emailHelpo,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    var currentUrlLogin = 'http://192.168.43.103:3000/login';
    var loggedIn = false;
    return Column(
      children: [
        Expanded(
          child: WebView(
            initialUrl: currentUrlLogin,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith(
                  "https://develop.d2u7plurp9z4jd.amplifyapp.com/")) {
                return NavigationDecision.navigate;
              } else {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              }
            },
          ),
        ),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
