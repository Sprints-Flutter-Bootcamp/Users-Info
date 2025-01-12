import 'package:empm/controllers/user_service.dart';
import 'package:empm/models/user_model.dart';
import 'package:empm/views/user_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users = [];
  void getUsers() async {
    users = await UserService().getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const Text(
              "Users",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserInfo(UserData: users[index])));
                    },
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.person_2),
                        title: Text(users[index].name),
                        subtitle: Text(users[index].email),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
