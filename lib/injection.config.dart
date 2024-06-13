// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ceti_labs/src/data/dataSource/local/shared_pref.dart' as _i6;
import 'package:ceti_labs/src/data/dataSource/remote/service/auth_service.dart'
    as _i4;
import 'package:ceti_labs/src/di/app_module.dart' as _i7;
import 'package:ceti_labs/src/domain/repository/auth_repository.dart' as _i3;
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart' as _i5;
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
    gh.factory<_i4.AuthService>(() => appModule.authService);
    gh.factory<_i5.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i6.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
