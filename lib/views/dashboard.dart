import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    );
  }
}