import 'package:flutter/material.dart';
import 'package:petpaw/app/features/auth/view/login/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(child: LoginBody()),
    );
  }
}
