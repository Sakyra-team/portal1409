import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<NavigationActionPolicy?> onRedirectWebView(
  BuildContext context,
  InAppWebViewController controller, 
  NavigationAction navigationAction,
) async {
  final uri = navigationAction.request.url;
  if (uri == null) {
    return NavigationActionPolicy.ALLOW;
  }

  final path = uri.path;

  if (path.startsWith("/apps")) {
    context.router.back();

    return NavigationActionPolicy.CANCEL;
  }

  return NavigationActionPolicy.ALLOW;
}
