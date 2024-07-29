import 'dart:convert';
import 'dart:io';

import 'package:ceti_labs/src/data/api/api_config.dart';
import 'package:ceti_labs/src/domain/models/support.dart';
import 'package:ceti_labs/src/domain/utils/list_to_string.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class SupportService {
  Future<String> token;
  SupportService(this.token);

  Future<Resource<Support>> register(Support support, List<File> files) async {
    try {
      Uri url = ApiConfig.getUri('/support');
      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;

      for (var file in files) {
        request.files.add(
          http.MultipartFile(
          'files[]',
          http.ByteStream(file.openRead().cast()), 
          await file.length(),
          filename: basename(file.path),
          contentType: MediaType('image', 'jpg'),
        )
      );
    }
      request.fields['device'] = support.device;
      request.fields['brand'] = support.brand;
      request.fields['componentA'] = support.componentA;
      request.fields['userId'] = support.userId.toString();
      final response = await request.send();
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Support supportResponse = Support.fromJson(data);
        return Success(supportResponse);
      } else {
        return Error(listToString(data['message']));
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
