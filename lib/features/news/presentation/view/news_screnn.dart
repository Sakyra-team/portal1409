import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:portal1409/core/web_views/web_views.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(newsUrl)),

          shouldOverrideUrlLoading: (controller, navigationAction) async =>
              await onRedirectWebView(context, controller, navigationAction),
        ),),
    );
  }
}