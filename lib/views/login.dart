import 'package:flutter/material.dart';
import 'package:myheartbeat_project/views/homePage.dart';
import 'package:myheartbeat_project/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _goToHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)));
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
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Palavra-passe',
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
                        onPressed: () {},
                        child: const Text('Login')
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