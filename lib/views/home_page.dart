import 'package:empm/views/add_user_page.dart';
import 'package:empm/views/users_api.dart';
import 'package:empm/views/users_firebase.dart';
import 'package:empm/widgets/my_app_bar.dart';
import 'package:empm/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Users Management App"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Firebase Users",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          const SizedBox(height: 20),
          myButton("Add User", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddUserPage()));
          }),
          myButton("Show Firestore Users", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersFirebase()));
          }),
          const SizedBox(height: 20),
          const Text(
            "API Users",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          myButton("Show API Users", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UsersAPI()));
          }),
        ],
      ),
    );
  }
}
