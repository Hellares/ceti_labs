
import 'package:ceti_labs/injection.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  //BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  
];

