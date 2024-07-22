import 'package:ceti_labs/src/domain/useCases/users/get_user_bydni_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/users/get_user_use_case.dart';

class UsersUseCases{
  GetUserUseCase getUsers;
  GetUserByDniUseCase getUserByDni;
  UsersUseCases({
    required this.getUsers,
    required this.getUserByDni
  });
}