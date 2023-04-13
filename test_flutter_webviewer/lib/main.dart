import 'package:flutter/material.dart';
import 'package:test_flutter_webviewer/url_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'src/web_view_stack.dart';

Future main() async {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 60.0,
            ),
            Image.asset("assets/images/logo-sidebar.png"),
            Text(
              "Chào mừng bạn đến với ứng dụng \nfake HELPO",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            UrlAndAuth(),
          ],
        )),
      ),
    );
  }
}
