import 'package:flutter/material.dart';
import 'package:myheartbeat_project/views/login.dart';
import 'package:myheartbeat_project/views/register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _goToRegistrationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
  }

  void _goToLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA71930),
      body: Center(
          child: Container(
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/MyHeartbeat.png', height: 500),
                  const SizedBox(height: 50),
                  Center(
                    child: Container(
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                              )
                          ),
                          onPressed: _goToRegistrationPage,
                          child: const Text('Registra-te gratuitamente')
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: TextButton(
                          onPressed: _goToLoginPage,
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white
                          ),
                          child: const Text(
                              'Iniciar sessão',
                              style: TextStyle(fontSize: 16)
                          )
                      ),
                    ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}