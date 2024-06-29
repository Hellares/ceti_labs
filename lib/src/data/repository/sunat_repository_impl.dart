import 'package:ceti_labs/src/data/dataSource/remote/service/sunat_service.dart';
import 'package:ceti_labs/src/domain/models/sunat_response.dart';
import 'package:ceti_labs/src/domain/repository/sunat_repository.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

class SunatRepositoryImpl implements SunatRepository{
  SunatService sunatService;
  SunatRepositoryImpl(this.sunatService);

  @override
  Future<Resource<SunatResponse>> getSunatDni(String numberDni) {
    return sunatService.getDniSunat(numberDni);
    
  }

}

