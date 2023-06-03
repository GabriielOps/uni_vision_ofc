import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_vision_ofc/contents/google_sing_in.dart';
import 'package:uni_vision_ofc/screens/cameras_menu.dart';
import 'package:uni_vision_ofc/screens/password_reset.dart';
import 'package:uni_vision_ofc/screens/resgister.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future dbSignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Icon(
                    Icons.video_chat_outlined,
                    color: Colors.black,
                    size: 150,
                  ),
                ),
                const SizedBox(
                    //Escrita Uni Vision
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0, top: 20),
                  child: Text(
                    'UNI - VISION',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                )),
                Padding(
                  //Login - E-Mail
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
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
                            labelText: 'Senha'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // Entrar
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      onPressed: () {
                        dbSignIn();
                      },
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ResetPasswordPage();
                        }));
                      },
                      child: const Text(
                        'Esqueci minha senha!',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // Esqueci minha Senha
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const RegisterPage();
                        }));
                      },
                      child: const Text(
                        'Registre - se',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 400,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 40, left: 40, top: 12, bottom: 12),
                        child: Divider(
                          thickness: 2,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {
                      singInWithGoogle().then((value) {
                        if (value != null) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const CamerasMenu(5);
                          }));
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/google_logo.png"),
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Entrar com Google',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
