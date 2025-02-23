import 'package:flutter/material.dart';
import 'package:nt_app/widgets/content_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContentContainer(
        child: SizedBox(
          height: 20,
        ),
      ),
    );
  }
}
