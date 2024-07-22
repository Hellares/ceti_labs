import 'package:ceti_labs/src/domain/repository/users_repository.dart';

class GetUserByDniUseCase{
  UsersRepository usersRepository;
  GetUserByDniUseCase(this.usersRepository);
  run(String dni) => usersRepository.getUserByDni(dni);
}