
import 'package:ceti_labs/src/domain/useCases/auth/get_user_session_usecase.dart';
import 'package:ceti_labs/src/domain/useCases/auth/login_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/auth/save_user_session_usecase.dart';

class AuthUseCases{

  LoginUseCase login;
  //RegisterUseCase register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;
  //LogoutUseCase logout;
  
  AuthUseCases({
    required this.login,
    //required this.register,
    required this.saveUserSession,
    required this.getUserSession,
    //required this.logout,
  });
}