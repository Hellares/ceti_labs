
import 'package:ceti_labs/src/domain/models/user_register.dart';
import 'package:ceti_labs/src/domain/repository/auth_repository.dart';

class RegisterUseCase{

  AuthRepository repository;

  RegisterUseCase(this.repository);

  run(UserRegister user) => repository.register(user);
}