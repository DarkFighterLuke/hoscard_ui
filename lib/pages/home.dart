import 'package:flutter/material.dart';
import 'package:hoscard_ui/services/auth.dart';

import '../configuration/config.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const Text(
              "Hoscard",
              style: TextStyle(fontSize: 72, color: Colors.orange),
            ),
            ElevatedButton(
              onPressed: () => {
                authService.openInWindow(
                    "http://${Config.backendAddress}:${Config.backendPort}/users/auth", "auth")
              },
              child: const Text(
                "Login with GitHub",
                style: TextStyle(fontSize: 32, color: Colors.orange),
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    ));
  }
}
