import 'package:ceti_labs/src/domain/repository/users_repository.dart';

class GetUserUseCase{
  UsersRepository usersRepository;
  GetUserUseCase(this.usersRepository);
  run() => usersRepository.getUser();

}