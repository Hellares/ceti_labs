
import 'package:ceti_labs/src/domain/useCases/devices/devices_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDeviceListBloc extends Bloc<AdminDeviceListEvent, AdminDeviceListState>{
  DevicesUseCases devicesUseCases;
  AdminDeviceListBloc(this.devicesUseCases) : super(AdminDeviceListState(response: Initial())){
    on<GetDevices>(_onGetDevices);
    on<UpdateDevices>(_onUpdateDevices);
  }

  Future<void> _onGetDevices(GetDevices event, Emitter<AdminDeviceListState> emit) async {
    emit(
      state.copyWith(
        response: Loading(),
      )
    );
    Resource response = await devicesUseCases.getDevices.run();
    emit(
      state.copyWith(
        response: response,
      )
    );
  }

  Future<void> _onUpdateDevices(UpdateDevices event, Emitter<AdminDeviceListState> emit) async {
    emit(state.copyWith(response: Loading()));
  }
  
  
}