import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoscard_ui/pages/dashboard.dart';
import 'package:hoscard_ui/pages/home.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      debugLogDiagnostics: true,
      initialLocation: Uri.base.toString().replaceFirst(Uri.base.origin, ''),
      routes: [
        GoRoute(
            path: "/", builder: (context, state) => Homepage(), name: "Home"),
        GoRoute(
          name: "Dashboard",
          path: "/:jwt",
          builder: (context, state) {
            final jwt = state.pathParameters["jwt"];
            if (jwt == null) return Homepage();
            return Dashboard(jwt);
          },
        )
      ]);

  static GoRouter get router => _router;
}
