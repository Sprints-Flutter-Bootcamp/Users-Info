import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empm/models/firebase/user_model_firebase.dart';
import 'package:empm/widgets/my_app_bar.dart';
import 'package:empm/widgets/my_button.dart';
import 'package:empm/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController AgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Users Management App"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Enter User Data",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
            Form(
              child: Column(
                children: [
                  MyTextField(
                    controller: fullNameController,
                    label: "Full Name",
                    labelIcon: Icons.person,
                    isPassword: false,
                  ),
                  MyTextField(
                    controller: emailController,
                    label: "Email",
                    labelIcon: Icons.email,
                    isPassword: false,
                  ),
                  MyTextField(
                    controller: AgeController,
                    label: "Age",
                    labelIcon: Icons.calendar_month,
                    isPassword: false,
                  ),
                  myButton("Add User", () async {
                    final new_user = FirebaseUser(
                      name: fullNameController.text,
                      email: emailController.text,
                      age: AgeController.text,
                    );

                    var db = FirebaseFirestore.instance;

                    // final docRef = db
                    //     .collection("users")
                    //     .withConverter(
                    //       fromFirestore: FirebaseUser.fromFirestore,
                    //       toFirestore: (FirebaseUser user, options) =>
                    //           user.toFirestore(),
                    //     )
                    //     .doc();
                    // await docRef.set(new_user);

                    await db
                        .collection("users")
                        .withConverter<FirebaseUser>(
                          fromFirestore: (snapshot, _) =>
                              FirebaseUser.fromFirestore(snapshot),
                          toFirestore: (FirebaseUser user, _) =>
                              user.toFirestore(),
                        )
                        .add(new_user);

                    fullNameController.clear();
                    emailController.clear();
                    AgeController.clear();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
