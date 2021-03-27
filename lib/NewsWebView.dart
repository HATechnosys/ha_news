import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final urlNews;

  NewsWebView(this.urlNews);



  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: '${widget.urlNews}',

        onPageStarted: (url) {
          

        },
        onPageFinished: (url) {

        },
      ),
    );
  }


}
