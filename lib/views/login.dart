import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myheartbeat_project/views/home_page.dart';
import 'package:myheartbeat_project/widgets/widgets.dart';
import 'package:myheartbeat_project/views/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _goToHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
      );
      Future(() {
        Widgets.showCustomDialog(
          context,
          title: "Sucesso",
          content: "Login efetuado com sucesso!"
      );

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardPage()), (_) => false);
      });
    } on FirebaseAuthException catch (_) {
      Future(() => Widgets.showCustomDialog(
          context,
          title: "Erro de autenticação",
          content: "E-mail ou Palavra-passe incorreta"
      ));
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA71930),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Palavra-passe',
                        labelStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFAF9F6),
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _login,
                          child: const Text('Login')
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: _goToHomePage,
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white
                        ),
                        child: const Text(
                            'Voltar',
                            style: TextStyle(fontSize: 16)
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}