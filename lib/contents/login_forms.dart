import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: loginController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.amber[50],
            border: const OutlineInputBorder(),
            labelText: 'E-Mail'),
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.amber[50],
            border: const OutlineInputBorder(),
            labelText: 'Senha'),
      ),
    );
  }
}
