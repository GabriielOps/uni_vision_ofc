import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_vision_ofc/screens/main_page.dart';

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

    Future signUp() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginController.text.trim(),
          password: passwordController.text.trim());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Registro',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                      labelText: 'Crie uma Senha forte!'),
                ),
              ),
            ),
          ),
          const Text('A senha deve conter ao menos 6 caracteres.'),
          SizedBox(
            // Esqueci minha Senha
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  signUp();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  }));
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
