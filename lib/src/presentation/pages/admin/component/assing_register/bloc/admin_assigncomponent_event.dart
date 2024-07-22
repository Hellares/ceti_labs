import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class AdminAssignComponentEvent extends Equatable{
  const AdminAssignComponentEvent();
  @override
  List<Object?> get props => [];
}

class AdminAssignComponentToDevice extends AdminAssignComponentEvent{
  final String idDevice;
  final BlocFormItem componentName;
  const AdminAssignComponentToDevice(this.idDevice, this.componentName);
  @override
  List<Object?> get props => [componentName];
}

class RegisterComponentFormSubmit extends AdminAssignComponentEvent{
  const RegisterComponentFormSubmit();
}

class FormReset extends AdminAssignComponentEvent{
  const FormReset();
}