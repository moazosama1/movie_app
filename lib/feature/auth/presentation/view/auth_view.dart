import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/auth/presentation/view/widgets/auth_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = kAuthView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBody(),
    );
  }
}
