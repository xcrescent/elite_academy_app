import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizWebView extends StatefulWidget {
  const QuizWebView({super.key, required this.url});
  final String url;

  @override
  State<QuizWebView> createState() => _QuizWebViewState();
}

class _QuizWebViewState extends State<QuizWebView> {
  var loadingPercentage = 0;

  final _key = UniqueKey();
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Expanded(
              child: WebViewWidget(
                key: _key,
                controller: controller,
              ),
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                minHeight: 10,
                value: loadingPercentage / 100.0,
              ),
          ],
        ),
      ),
    );
  }
}
