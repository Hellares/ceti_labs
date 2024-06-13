import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_event.dart';
import 'package:ceti_labs/src/presentation/pages/roles/bloc/roles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState>{

  AuthUseCases authUseCases;

  RolesBloc(this.authUseCases): super(RolesState()){
    on<GetRolesList>(_onGetRolesList);
  }

  Future<void> _onGetRolesList(GetRolesList event, Emitter<RolesState> emit)async{
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    emit(
      state.copyWith(
        roles: authResponse?.user.roles
      )
    );
  }
}