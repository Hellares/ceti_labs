// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ceti_labs/src/data/dataSource/remote/service/support_service.dart'
    as _i5;
import 'package:ceti_labs/src/di/app_module.dart' as _i7;
import 'package:ceti_labs/src/di/di.dart' as _i3;
import 'package:ceti_labs/src/domain/repository/support_repository.dart' as _i4;
import 'package:ceti_labs/src/domain/useCases/support/supports_use_cases.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i3.AuthService>(() => appModule.authService);
    gh.factory<_i3.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i3.DeviceRepository>(() => appModule.deviceRepository);
    gh.factory<_i3.DeviceService>(() => appModule.deviceService);
    gh.factory<_i3.DevicesUseCases>(() => appModule.devicesUseCases);
    gh.factory<_i3.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i3.SunatRepository>(() => appModule.sunatRepository);
    gh.factory<_i3.SunatService>(() => appModule.sunatService);
    gh.factory<_i3.SunatUseCases>(() => appModule.sunatUseCases);
    gh.factory<_i4.SupportRepository>(() => appModule.supportRepository);
    gh.factory<_i5.SupportService>(() => appModule.supportService);
    gh.factory<_i6.SupportsUseCases>(() => appModule.supportsUseCases);
    gh.factory<_i3.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i3.UsersService>(() => appModule.userService);
    gh.factory<_i3.UsersUseCases>(() => appModule.usersUseCases);
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
