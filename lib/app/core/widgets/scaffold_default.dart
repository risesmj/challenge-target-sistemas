import 'package:challenge_target_sistemas/app/pages/google_web_view.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  final Widget child;

  const ScaffoldBase({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF215165),
                Color(0xFF2b8e89),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(child: child),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GoogleWebView(),
                    ),
                  );
                },
                child: const Text(
                  'Política de Privacidade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
