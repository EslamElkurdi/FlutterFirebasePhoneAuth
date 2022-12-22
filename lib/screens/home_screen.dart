import 'package:firebaseproject/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("FlutterPhone Auth"),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
