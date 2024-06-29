import 'package:ceti_labs/src/domain/repository/auth_repository.dart';

class LogoutUseCase{

  AuthRepository repository;

  LogoutUseCase(this.repository);

  run() => repository.logout();

}