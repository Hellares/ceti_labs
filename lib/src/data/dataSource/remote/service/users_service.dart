import 'dart:convert';

import 'package:ceti_labs/src/data/api/api_config.dart';
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/utils/list_to_string.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;

class UsersService{
  Future<String> token;
  UsersService(this.token);

  Future<Resource<List<User>>> getUsers() async{
    try {
      Uri url = Uri.https(ApiConfig.apiCetiLabs, '/users');
      Map<String, String> headers = { 
        "Content-Type": "application/json",
        "Authorization": await token
        };
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){        
        List<User> users = User.fromJsonList(data);
        return Success(users);
      }
      else{
        return Error(listToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}