import 'package:flutter/material.dart';
import 'package:myheartbeat_project/views/homePage.dart';
import 'package:myheartbeat_project/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myheartbeat_project/widgets/widgets.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  void _goToHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)));
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  Future<void> _register() async {
    if (_passwordController.text == _repeatPasswordController.text) {
      try {
        await FirebaseAuth.instance.signInAnonymously(
          //email: _emailController.text,
          //password: _passwordController.text,
        );
        Future(() => Widgets.showCustomDialog(
            context,
            title: "Sucesso",
            content: "Registo efetuado com sucesso!"
        ));

        _emailController.clear();
        _passwordController.clear();
        _repeatPasswordController.clear();

      } on FirebaseAuthException catch (e) {
        Widgets.showCustomDialog(
            context,
            title: "Erro de autenticação",
            content: e.message ?? "Ocorreu um erro durante o registo."
        );
      }
    } else {
      Widgets.showCustomDialog(
          context,
          title: "Erro",
          content: "As passwords não coincidem!"
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA71930),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Center(
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Palavra-passe',
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _repeatPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repetir Palavra-passe',
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFAF9F6),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: _register,
                        child: const Text('Registrar')
                    ),
                  ),
                ),
                Center(
                  child: Container(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}