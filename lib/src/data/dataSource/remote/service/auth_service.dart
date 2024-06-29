import 'dart:convert';
import 'package:ceti_labs/src/data/api/api_config.dart';
import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/models/auth_response_register.dart';
import 'package:ceti_labs/src/domain/models/user_register.dart';
import 'package:ceti_labs/src/domain/utils/list_to_string.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;



class AuthService{
  Future<Resource<AuthResponse>> login(String dni, String password) async {
    try{
      Uri url = Uri.http(ApiConfig.apiCetiLabs, '/auth/login');
      Map<String, String> headers = { "Content-Type": "application/json" };
      String body = json.encode({
        'dni': dni,
        'password': password
      });
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);      
      if(response.statusCode == 200 || response.statusCode == 201){        
        AuthResponse authResponse = AuthResponse.fromJson(data);
        //print(data.toString());
        return Success(authResponse);
      }
      else{
        return Error(listToString(data['message']));        
      }
    } catch(e){
      
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponseRegister>> register(UserRegister user) async {
    try{
      Uri url = Uri.http(ApiConfig.apiCetiLabs, '/auth/register');
      Map<String, String> headers = { "Content-Type": "application/json" };
      String body = json.encode(user.toJson());
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        AuthResponseRegister authResponseRegister = AuthResponseRegister.fromJson(data);
        //print(authResponse.toJson());
        return Success(authResponseRegister);
      }
      else{
        return Error(listToString(data['message'].toString()));
      }
    } catch(e){
      //print('Error:  $e');
      return Error(e.toString());
    }
  }

}