import 'package:flutter/material.dart';
import 'package:shopping_app/screens/message_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text('Account Settings'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MessageScreen()),
              );
            },
            icon: Icon(Icons.message_outlined),
          ),
        ],
      ),
      body: Center(child: Text('Notifications Page')),
    );
  }
}
