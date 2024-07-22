import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class AdminRegisterDeviceEvent extends Equatable{
  const AdminRegisterDeviceEvent();
  @override
  List<Object?> get props => [];
}

class AdminRegisterDeviceInitEvent extends AdminRegisterDeviceEvent{
  const AdminRegisterDeviceInitEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends AdminRegisterDeviceEvent{
  final BlocFormItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class PickImage extends AdminRegisterDeviceEvent{
  const PickImage();
  @override
  List<Object?> get props => [];
}

class TakePhoto extends AdminRegisterDeviceEvent{
  const TakePhoto();
  @override
  List<Object?> get props => [];
}

class FormSubmit extends AdminRegisterDeviceEvent{
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ResetForm extends AdminRegisterDeviceEvent{
  const ResetForm();
  @override
  List<Object?> get props => [];
}

