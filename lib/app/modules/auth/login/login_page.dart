import 'package:ems/app/modules/auth/login/widgets/blocks/login_block.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LoginBlock(),
        ),
      ),
    );
  }
}
