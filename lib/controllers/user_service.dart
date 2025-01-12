import 'package:dio/dio.dart';
import 'package:empm/models/user_model.dart';

class UserService {
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      print("Calling API");
      var response = await Dio().get(endpoint);
      var data = response.data;
      data.forEach((user) => users.add(UserModel.fromJson(user)));
    } catch (e) {
      print("Catching error!");
      print(e.toString());
    }
    print("Returning users");
    return users;
  }
}
