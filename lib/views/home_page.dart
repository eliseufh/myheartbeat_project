import 'package:flutter/material.dart';
import 'package:myheartbeat_project/views/login.dart';
import 'package:myheartbeat_project/views/register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      backgroundColor: const Color(0xFFA71930),
      body: Center(
          child: SizedBox(
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 3, child:  Image.asset('assets/images/MyHeartbeat.png')),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(width: double.infinity, height: 50,
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
                        TextButton(
                        onPressed: _goToLoginPage,
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white
                        ),
                        child: const Text(
                            'Iniciar sessão',
                            style: TextStyle(fontSize: 16)
                        )
                    ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}