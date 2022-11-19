import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:polines_news_app/custom_scaffold.dart';

class NewsWebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;
  const NewsWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
