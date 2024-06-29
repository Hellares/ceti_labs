import 'package:ceti_labs/src/data/dataSource/remote/service/users_service.dart';
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/repository/users_repository.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

class UsersRepositoryImpl extends UsersRepository{
  UsersService userService;
  UsersRepositoryImpl(this.userService);

  @override
  Future<Resource<List<User>>> getUser() {
    return userService.getUsers();
  }
}