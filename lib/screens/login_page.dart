import 'package:flutter/material.dart';

import '../contents/login_forms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                //Escrita Uni Vision
                child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text(
                'UNI - VISION',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            )),
            const Padding(
              //Login - E-Mail
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Login(),
              ),
            ),
            const Padding(
              //Login - Senha
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Password(),
              ),
            ),
            SizedBox(
              // Entrar
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {/* Adicionar Função Aqui */},
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              // Esqueci minha Senha
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {/* Adicionar Função Aqui */},
                  child: const Text(
                    'Esqueci minha senha!',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            const Column(
              children: [
                Divider(),
              ],
            )
          ],
        ));
  }
}
