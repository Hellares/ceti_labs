
import 'package:ceti_labs/src/data/dataSource/local/shared_pref.dart';
import 'package:ceti_labs/src/data/repository/auth_repository_impl.dart';
import 'package:ceti_labs/src/data/dataSource/remote/service/auth_service.dart';
import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/repository/auth_repository.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/domain/useCases/auth/get_user_session_usecase.dart';
import 'package:ceti_labs/src/domain/useCases/auth/login_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/auth/save_user_session_usecase.dart';
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

  //@injectable
  //UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  // @injectable
  // CategoriesRepository get categoriesRepository => CategoriesRespositoryImp(categoryService);

  // @injectable
  // ProductsRepository get productsRepository => ProductsRepositoryImpl(productsService);

  // @injectable
  // ShoppingBagRepository get shoppingBagRepository => ShoppingBagRepositoryImpl(sharedPref);
  
  // @injectable
  // AddressRepository get addressRepository => AddressRepositoryImpl(addressService, sharedPref);

  // @injectable
  // MercadoPagoRepository get mercadoPagoRepository => MercadoPagoRepositoryImpl(mercadoPagoService);


  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository), 
    //register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    //logout: LogoutUseCase(authRepository),
  );

  
}