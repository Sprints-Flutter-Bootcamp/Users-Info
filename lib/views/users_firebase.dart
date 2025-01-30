import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empm/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

import '../models/firebase/user_model_firebase.dart';

class UsersFirebase extends StatefulWidget {
  const UsersFirebase({super.key});

  @override
  State<UsersFirebase> createState() => _UsersFirebaseState();
}

class _UsersFirebaseState extends State<UsersFirebase> {
  List<FirebaseUser> users = [];
  bool isLoading = true; // Track loading state

  void getUsers() async {
    final db = FirebaseFirestore.instance;
    try {
      final event = await db.collection("users").get();
      setState(() {
        users =
            event.docs.map((doc) => FirebaseUser.fromFirestore(doc)).toList();
        isLoading = false; // Set loading to false after fetching
      });
    } catch (e) {
      print("Error fetching users: $e");
      setState(() {
        isLoading = false; // Stop loading even on error
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Users Management App"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Firebase Users",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator()) // Show loader while fetching data
                : users.isEmpty
                    ? const Center(
                        child: Text(
                        "No users found",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(users[index].name ?? "No Name"),
                              subtitle: Text(users[index].email ?? "No Email"),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
