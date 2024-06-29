import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/models/auth_response_register.dart';
import 'package:ceti_labs/src/domain/models/user_register.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

abstract class AuthRepository {

  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<Resource<AuthResponse>> login(String dni, String password);
  Future<Resource<AuthResponseRegister>> register(UserRegister user);

  
}