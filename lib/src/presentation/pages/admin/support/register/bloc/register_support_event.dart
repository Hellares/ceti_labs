
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterSupportEvent extends Equatable {
  const RegisterSupportEvent();
  @override
  List<Object?> get props => [];
}

class RegisterSupportInitEvent extends RegisterSupportEvent {
  final User? user;
  const RegisterSupportInitEvent({this.user});
  @override
  List<Object?> get props => [user];
}

class DeviceChanged extends RegisterSupportEvent {
  final BlocFormItem device;
  const DeviceChanged({required this.device});
  @override
  List<Object?> get props => [device];
}

class BrandChanged extends RegisterSupportEvent {
  final BlocFormItem brand;
  const BrandChanged({required this.brand});
  @override
  List<Object?> get props => [brand];
}

class ComponentAChanged extends RegisterSupportEvent {
  final BlocFormItem componentA;
  const ComponentAChanged({required this.componentA});
  @override
  List<Object?> get props => [componentA];
}

class PickImage extends RegisterSupportEvent{
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends RegisterSupportEvent{
  final int numberFile;
  const TakePhoto({required this.numberFile});
}

class FormSubmit extends RegisterSupportEvent{
  const FormSubmit();
  @override
  List<Object?> get props => [];
}