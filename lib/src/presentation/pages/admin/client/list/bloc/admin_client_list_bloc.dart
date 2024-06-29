
import 'package:ceti_labs/src/domain/useCases/users/users_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminClientListBloc extends Bloc<AdminClientListEvent, AdminClientListState>{
  UsersUseCases usersUseCases;
  AdminClientListBloc(this.usersUseCases) : super(AdminClientListState(response: Initial())){
    on<GetClients>(_onGetClients);
    //on<MakeCallEvent>(_onMakeCall);
    
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

  
  // Future<void> _onMakeCall(MakeCallEvent event, Emitter<AdminClientListState> emit) async {
  //   emit(
  //     state.copyWith(
  //       response: Loading(),
  //     )
  //   );
  //   try {
  //     Resource response = await usersUseCases.callerPhone.run(event.phone);
  //     emit(
  //       state.copyWith(
  //         response: Success(response),
  //       ),
  //     );
  //   } catch (e) {
  //     emit(
  //       state.copyWith(
  //         response: Error(e.toString()),
  //       ),
  //     );
  //   }
  // }
}