import 'package:ceti_labs/src/domain/repository/sunat_repository.dart';

class GetDataDniUseCase{
  SunatRepository sunatRepository;
  GetDataDniUseCase(this.sunatRepository);

  run(String numberDni) => sunatRepository.getSunatDni(numberDni);
}