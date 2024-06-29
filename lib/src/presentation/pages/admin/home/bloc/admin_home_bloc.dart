import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/bloc/admin_home_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/home/bloc/admin_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState>{
  AuthUseCases authUseCases;
  AdminHomeBloc(this.authUseCases) : super(AdminHomeState()){
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
    on<AdminLogout>(_onLogout);

  }

  Future<void> _onAdminChangeDrawerPage(AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async{
    emit(
      state.copyWith(
        pageIndex: event.pageIndex,
      )
    );
  }

  Future<void> _onLogout(AdminLogout event, Emitter<AdminHomeState> emit) async{
    await authUseCases.logout.run();
  }
}