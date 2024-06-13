import 'package:ceti_labs/src/data/dataSource/local/shared_pref.dart';
import 'package:ceti_labs/src/data/dataSource/remote/service/auth_service.dart';
import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/repository/auth_repository.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';



class AuthRepositoryImpl implements AuthRepository{

  AuthService authService;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String dni, String password) {
    return authService.login(dni, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    throw UnimplementedError();
    //return authService.register(user);
  }
  
  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');
      if(data != null){
        AuthResponse authResponse = AuthResponse.fromJson(await sharedPref.read('user'));
        return authResponse;
      } 
    return null;
  }
  
  @override
  Future<void> saveUserSession(AuthResponse authResponse) async{
    sharedPref.save('user', authResponse.toJson());
  }
  
  // @override
  // Future<bool> logout() async {
  //   return await sharedPref.remove('user');
  // }

}