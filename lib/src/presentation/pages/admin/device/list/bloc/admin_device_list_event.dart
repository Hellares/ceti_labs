import 'package:equatable/equatable.dart';

abstract class AdminDeviceListEvent extends Equatable{
  const AdminDeviceListEvent();

  @override
  List<Object?> get props => [];
}

class GetDevices extends AdminDeviceListEvent{
  const GetDevices();

  @override
  List<Object?> get props => [];
}

class UpdateDevices extends AdminDeviceListEvent{
  const UpdateDevices();

  @override
  List<Object?> get props => [];
}

