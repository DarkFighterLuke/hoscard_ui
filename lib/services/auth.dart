import 'dart:html' as html;

import 'package:hoscard_ui/configuration/config.dart';

class AuthService {
  void openInWindow(String uri, String name) {
    html.window.location.href =
        "http://${Config.backendAddress}:${Config.backendPort}/users/auth";
  }
}
