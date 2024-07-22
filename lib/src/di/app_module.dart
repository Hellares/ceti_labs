
import 'package:ceti_labs/src/di/di.dart';
import 'package:ceti_labs/src/domain/useCases/devices/assign_component_todevice_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/devices/register_device_use_case.dart';


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
  DeviceService get deviceService => DeviceService(token);

  @injectable
  DeviceRepository get deviceRepository => DeviceRepositoryImpl(deviceService);

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
    getUserByDni: GetUserByDniUseCase(usersRepository),
  );
  
  @injectable
  SunatUseCases get sunatUseCases => SunatUseCases(
    getDataDni: GetDataDniUseCase(sunatRepository),
  );

  @injectable
  DevicesUseCases get devicesUseCases => DevicesUseCases(
    getDevices: GetDeviceUseCase(deviceRepository),
    getComponentByDevice: GetComponentByDeviceUseCase(deviceRepository),
    assignComponentToDevice: AssignComponentToDeviceUseCase(deviceRepository),
    registerDevice: RegisterDeviceUseCase(deviceRepository)
  );
}