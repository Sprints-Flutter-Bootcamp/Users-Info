import 'package:empm/models/user_model.dart';
import 'package:flutter/material.dart';

Widget UserCard({required UserModel user}) {
  return Card(
    // color: Colors.white,
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(
        leading: const Icon(Icons.person_2),
        title: Text(user.name),
        subtitle: Text("Username: ${user.username}"),
      ),
      ListTile(
        leading: const Icon(Icons.email),
        title: Text(user.email),
        subtitle: Text("Phone: ${user.phone}"),
      ),
      ListTile(
        leading: const Icon(Icons.location_on),
        title: Text("City: ${user.address.city}"),
        subtitle: Text("Street: ${user.address.street}"),
      ),
      ListTile(
        leading: const Icon(Icons.web),
        title: Text("Company: ${user.company.name}"),
        subtitle: Text("Website: ${user.company.name}"),
      ),
    ]),
  );
}
