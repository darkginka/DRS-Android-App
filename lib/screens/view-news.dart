import 'dart:async';
import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewNews extends StatefulWidget {
  const ViewNews({Key? key, required this.url, required this.title})
      : super(key: key);
  final String url, title;
  @override
  _ViewNewsState createState() => _ViewNewsState();
}

class _ViewNewsState extends State<ViewNews> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: WidgetUtils.buildAppBar(context, widget.title),
      body: Stack(children: [
        WebView(
          initialUrl: widget.url,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ]),
    ));
  }
}
