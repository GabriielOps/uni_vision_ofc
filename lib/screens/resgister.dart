import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Registro'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
              width: 300,
              //Escrita Uni Vision
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.0, top: 20),
                child: Text(
                  'Seja Bem vindo!',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            //Login - E-Mail
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: loginController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.amber[50],
                    border: const OutlineInputBorder(),
                    labelText: 'Coloque seu melhor E-Mail'),
              ),
            ),
          ),
          Padding(
            //Login - Senha
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.amber[50],
                      border: const OutlineInputBorder(),
                      labelText: 'Faça uma Senha forte!'),
                ),
              ),
            ),
          ),
          SizedBox(
            // Esqueci minha Senha
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
