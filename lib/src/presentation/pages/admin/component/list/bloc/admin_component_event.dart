import 'package:equatable/equatable.dart';

abstract class AdminComponentEvent extends Equatable{
  const AdminComponentEvent();
  @override
  List<Object?> get props => [];
}

class GetComponentByNameDevice extends AdminComponentEvent{
  final String name;
  const GetComponentByNameDevice(this.name);
  @override
  List<Object?> get props => [name];
}

class AssignComponentToDevice extends AdminComponentEvent{
  final String idDevice;
  final String componentName;
  const AssignComponentToDevice(this.idDevice,this.componentName);
  @override
  List<Object?> get props => [idDevice,componentName];
}
