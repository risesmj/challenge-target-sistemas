import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleWebView extends StatefulWidget {
  const GoogleWebView({super.key});

  @override
  State<GoogleWebView> createState() => _GoogleWebViewState();
}

class _GoogleWebViewState extends State<GoogleWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
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
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.google.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Política de Privacidade')),
      body: WebViewWidget(controller: controller),
    );
  }
}
