import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/image/logo part 1.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
