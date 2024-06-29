import 'package:ceti_labs/src/domain/models/sunat_response.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

abstract class SunatRepository{
  
  Future<Resource<SunatResponse>> getSunatDni(String numberDni);
}