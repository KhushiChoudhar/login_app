import 'package:login_flutter/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Firebase auth=FirebaseAuth.instanceFor(app: app)
final user = FirebaseAuth.instance.currentUser!;

class HomePage extends StatelessWidget {
  HomePage({super.key});

// sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    FirebaseServices().googleSignOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Text(
        "LOGGED IN AS: " + user.email!,
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
