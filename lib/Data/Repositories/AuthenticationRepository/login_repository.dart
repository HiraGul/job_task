import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:job_task/Data/Model/UserModel/user_class.dart';
import 'package:job_task/DataController/UserDataController/user_data_controller.dart';

class UserLoginRepository {
  static Future<int> userLogin() async {
    try {
      const loginUrl = 'https://jsonplaceholder.typicode.com/users';
      final response = await http.get(
        Uri.parse(loginUrl),
      );
      print("Response of api call ${response.body}");

      if (response.statusCode == 200) {
        UserDataController.userModelClass =
            userModelClassFromJson((response.body));
      }
      return response.statusCode;
    } on SocketException catch (e) {
      return 501;
    } on Exception catch (e) {
      return 0;
    }
  }
}
