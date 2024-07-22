
import 'package:ceti_labs/src/domain/useCases/users/users_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminClientListBloc extends Bloc<AdminClientListEvent, AdminClientListState>{
  UsersUseCases usersUseCases;
  AdminClientListBloc(this.usersUseCases) : super(AdminClientListState(response: Initial())){
    on<GetClients>(_onGetClients);
    on<SearchClients>(_onSearchClients);
    
  }

  Future<void> _onGetClients(GetClients event, Emitter<AdminClientListState> emit) async {
    emit(
      state.copyWith(
        response: Loading(),
      )
    );
    Resource response = await usersUseCases.getUsers.run();
    emit(
      state.copyWith(
        response: response,
      )
    );

  }

  
  Future<void> _onSearchClients(SearchClients event, Emitter<AdminClientListState> emit) async {
    emit(
      state.copyWith(
        response: Loading(),
      )
    );
    try {
      Resource response = await usersUseCases.getUserByDni.run(event.dni);
      emit(
        state.copyWith(
          response: response,
        )
      );
    } catch (e) {
      emit(
        state.copyWith(
          response: Error(e.toString()),
        )
      );
    }
  }
}