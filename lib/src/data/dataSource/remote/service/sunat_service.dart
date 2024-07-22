import 'dart:convert';

import 'package:ceti_labs/src/data/api/api_config.dart';
import 'package:ceti_labs/src/domain/models/sunat_response.dart';
import 'package:ceti_labs/src/domain/utils/list_to_string.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;

class SunatService{

  SunatService();
  Future<Resource<SunatResponse>> getDniSunat(String numberDni) async{
    try {
      Uri url = Uri.http(ApiConfig.apiCetiLabs, '/sunat/$numberDni');
      Map<String, String> headers = { 
        "Content-Type": "application/json",
        //"Authorization": await token
        };
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        SunatResponse sunatResponse = SunatResponse.fromJson(data);
        //print(sunatResponse.data.toJson());
        return Success(sunatResponse);
      }
      else{
        return Error(listToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}