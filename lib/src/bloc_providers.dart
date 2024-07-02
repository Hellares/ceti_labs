
import 'package:ceti_labs/injection.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/domain/useCases/sunat/sunat_use_cases.dart';
import 'package:ceti_labs/src/domain/useCases/users/users_use_cases.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/unosolo/bloc/unosolo_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/unosolo/bloc/unosolo_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/bloc/admin_home_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterClientBloc>(create: (context) => RegisterClientBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc(locator<AuthUseCases>())),
  BlocProvider<AdminClientListBloc>(create: (context) => AdminClientListBloc(locator<UsersUseCases>())),
  BlocProvider<ConsultaDniBloc>(create: (context) => ConsultaDniBloc(locator<SunatUseCases>())),
  BlocProvider<UnoSoloBloc>(create: (context) => UnoSoloBloc(locator<SunatUseCases>(),locator<AuthUseCases>())..add(UnosoloInitEvent())),
];

