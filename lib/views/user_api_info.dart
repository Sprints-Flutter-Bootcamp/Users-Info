import 'package:empm/models/user_model.dart';
import 'package:empm/widgets/my_app_bar.dart';
import 'package:empm/widgets/user_card.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key, required this.UserData});
  final UserModel UserData;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Users Management App"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.blue,
              ),
              UserCard(user: widget.UserData),
            ],
          ),
        ),
      ),
    );
  }
}
