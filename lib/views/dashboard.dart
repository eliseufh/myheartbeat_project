import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:myheartbeat_project/views/home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? get _username => FirebaseAuth.instance.currentUser?.email;

  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));
  }

  List<SensorValue> data = [];
  int? bpmValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA71930),
      appBar: AppBar(
        leading: Container(),
        backgroundColor: const Color(0xFFA71930),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Logout') {
                _logout();
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'User',
                  child: Text(FirebaseAuth.instance.currentUser?.email ?? 'Utilizador não identificado', style: const TextStyle(color: Colors.black)),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout', style: TextStyle(color: Colors.black)),
                ),
              ];
            },
            icon: const Icon(Icons.account_circle, color: Colors.white, size: 40),
          ),
        ],
      ),
      body: Center(
        child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Cubra a câmera e o flash com o seu dedo",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 22,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        size: 88,
                        color: Colors.red,
                      ),
                      HeartBPMDialog(
                        context: context, 
                        onRawData: (value) {
                          setState(() {
                            if (data.length == 100) {
                              data.removeAt(0);
                            }
                            data.add(value);
                          });
                        },
                        onBPM: (value) => setState(() {
                          bpmValue = value;
                        }),
                        child: Text(
                          bpmValue?.toString() ?? "-",
                          style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
              ],
        ),
      ),
    );
  }
}