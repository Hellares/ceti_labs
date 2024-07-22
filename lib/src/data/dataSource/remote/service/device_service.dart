import 'dart:convert';
import 'dart:io';

import 'package:ceti_labs/src/data/api/api_config.dart';
import 'package:ceti_labs/src/domain/models/component_device_response.dart';
import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/utils/list_to_string.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class DeviceService{
  Future<String> token;
  DeviceService(this.token);

  Future<Resource<List<Device>>> getDevices() async{
    try {
      Uri url = Uri.http(ApiConfig.apiCetiLabs, '/device');
      Map<String, String> headers = { 
        "Content-Type": "application/json",
        "Authorization": await token
        };
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        List<Device> devices = Device.fromJsonList(data);
        return Success(devices);
      }
      else{
        return Error(listToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<ComponentDeviceResponse>> getComponentDevice(String compo) async{
    try {
      Uri url = Uri.http(ApiConfig.apiCetiLabs, '/device/components/$compo');
      Map<String, String> headers = { 
        "Content-Type": "application/json",
        "Authorization": await token
        };
      final response = await http.get(url, headers: headers);
      final data = jsonDecode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        ComponentDeviceResponse componentDeviceResponse = ComponentDeviceResponse.fromJson(data);
        return Success(componentDeviceResponse);
      }
      else{
        return Error(listToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<ComponentDeviceResponse>> assignComponentToDevice(String idDevice, String componentName) async{
    try {
      Uri url = Uri.http(ApiConfig.apiCetiLabs, '/device/$idDevice/components');
      Map<String, String> headers = { 
        "Content-Type": "application/json",
        "Authorization": await token
        };
      
      String body = json.encode({'name': componentName});
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
        ComponentDeviceResponse component = ComponentDeviceResponse.fromJson(data);
        return Success(component);
      }
      else{
        return data['message'];
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<Resource<Device>> createDevice(Device device, File file) async{
    try{
      Uri url = Uri.http(ApiConfig.apiCetiLabs,'/device');
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;
      request.files.add(http.MultipartFile(
        'image',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')
      ));
      request.fields['name'] = device.name;
      final response = await request.send();
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if(response.statusCode == 200 || response.statusCode == 201){
        Device deviceResponse = Device.fromJson(data);
        return Success(deviceResponse);
      }
      else{
        return Error(listToString(data['message']));
      }
    }catch(e){
      return Error(e.toString());
    }
  }
}

