import 'package:ceti_labs/src/domain/useCases/devices/devices_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/component/list/bloc/admin_component_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/component/list/bloc/admin_componet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminComponentBloc extends Bloc<AdminComponentEvent, AdminComponentState>{
  DevicesUseCases devicesUseCases;
  AdminComponentBloc(this.devicesUseCases) : super(AdminComponentState(response: Initial())){
    on<GetComponentByNameDevice>(_onGetComponentByNameDevice);
    on<AssignComponentToDevice>(_onAssignComponentToDevice);
  }
  
  Future<void> _onGetComponentByNameDevice(GetComponentByNameDevice event, Emitter<AdminComponentState> emit) async {
    emit(
      state.copyWith(
        response: Loading()
      )
    );
    Resource response = await devicesUseCases.getComponentByDevice.run(event.name);
    if(response is Success){
      emit(
        state.copyWith(
          response: Success(response.data),
        )
      );
    }
  }

  Future<void> _onAssignComponentToDevice(AssignComponentToDevice event, Emitter<AdminComponentState> emit) async {
    try {
      emit(
        state.copyWith(
          response: Loading()
        )
      );
      Resource response = await devicesUseCases.assignComponentToDevice.run(event.idDevice, event.componentName);
      if(response is Success){
        emit(
          state.copyWith(
            response: Success(response.data),
          )
        );
      }else if (response is Error) {
        emit(state.copyWith(response: Error(response.message)));
      }
      
    } catch (e) {
      emit(state.copyWith(response: Error(e.toString())));
    }
  }
}