import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

abstract class UsersRepository{
  Future<Resource<List<User>>> getUser();
  Future<Resource<List<User>>> getUserByDni(String dni);
}