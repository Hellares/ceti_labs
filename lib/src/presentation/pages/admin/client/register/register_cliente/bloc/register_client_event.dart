import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterClientEvent extends Equatable{
  const RegisterClientEvent();
  @override
  List<Object?> get props => [];
}

class RegisterInitEvent extends RegisterClientEvent{
  const RegisterInitEvent();
}

class RegisterDniChanged extends RegisterClientEvent {
  final BlocFormItem dni;
  const RegisterDniChanged({required this.dni});
  @override
  List<Object?> get props => [dni];
}

class RegisterNameChanged extends RegisterClientEvent {
  final BlocFormItem name;
  const RegisterNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class RegisterLastnameChanged extends RegisterClientEvent {
  final BlocFormItem lastname;
  const RegisterLastnameChanged({required this.lastname});
  @override
  List<Object?> get props => [lastname];
}

class RegisterEmailChanged extends RegisterClientEvent {
  final BlocFormItem email;
  const RegisterEmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class RegisterPhoneChanged extends RegisterClientEvent {
  final BlocFormItem phone;
  const RegisterPhoneChanged({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class RegisterPasswordChanged extends RegisterClientEvent {
  final BlocFormItem password;
  const RegisterPasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

class RegisterFormSubmit extends RegisterClientEvent{
  const RegisterFormSubmit();

}
