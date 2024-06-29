
import 'package:ceti_labs/src/data/dataSource/local/shared_pref.dart';
import 'package:ceti_labs/src/data/dataSource/remote/service/sunat_service.dart';
import 'package:ceti_labs/src/data/dataSource/remote/service/users_service.dart';
import 'package:ceti_labs/src/data/repository/auth_repository_impl.dart';
import 'package:ceti_labs/src/data/dataSource/remote/service/auth_service.dart';
import 'package:ceti_labs/src/data/repository/sunat_repository_impl.dart';
import 'package:ceti_labs/src/data/repository/users_repository_impl.dart';
import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/repository/auth_repository.dart';
import 'package:ceti_labs/src/domain/repository/sunat_repository.dart';
import 'package:ceti_labs/src/domain/repository/users_repository.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/domain/useCases/auth/get_user_session_usecase.dart';
import 'package:ceti_labs/src/domain/useCases/auth/login_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/auth/logout_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/auth/register_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/auth/save_user_session_usecase.dart';
import 'package:ceti_labs/src/domain/useCases/sunat/get_data_dni_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/sunat/sunat_use_cases.dart';
import 'package:ceti_labs/src/domain/useCases/users/get_user_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/users/users_use_cases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule{

  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async{
    String token = "";
    final userSession = await sharedPref.read('user');      
      if(userSession != null){
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
      }
    return token;
  }

  @injectable
  AuthService get authService => AuthService();
  
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService,sharedPref);

  @injectable
  UsersService get userService => UsersService(token);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(userService);
  
  @injectable
  SunatService get sunatService => SunatService();

  @injectable
  SunatRepository get sunatRepository => SunatRepositoryImpl(sunatService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository), 
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
  );

  @injectable
  UsersUseCases get usersUseCases => UsersUseCases(
    getUsers: GetUserUseCase(usersRepository),
  );
  
  @injectable
  SunatUseCases get sunatUseCases => SunatUseCases(
    getDataDni: GetDataDniUseCase(sunatRepository),
  );
}