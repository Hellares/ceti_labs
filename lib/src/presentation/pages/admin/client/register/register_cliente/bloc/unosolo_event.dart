import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class UnosoloEvent extends Equatable{
  const UnosoloEvent();
  @override
  List<Object?> get props => [];
}

class UnosoloInitEvent extends UnosoloEvent{
  const UnosoloInitEvent();
}

class NumberDniSearchChanged extends UnosoloEvent {
  final BlocFormItem numberDniSearch;
  const NumberDniSearchChanged({required this.numberDniSearch});
  @override
  List<Object?> get props => [numberDniSearch];
}

class ButtonPressedSearch extends UnosoloEvent {
  const ButtonPressedSearch();
}

//--------------------------------------------------------------------------------------

class RegisterDniChanged extends UnosoloEvent {
  final BlocFormItem dni;
  const RegisterDniChanged({required this.dni});
  @override
  List<Object?> get props => [dni];
}

class RegisterNameChanged extends UnosoloEvent {
  final BlocFormItem name;
  const RegisterNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class RegisterLastnameChanged extends UnosoloEvent {
  final BlocFormItem lastname;
  const RegisterLastnameChanged({required this.lastname});
  @override
  List<Object?> get props => [lastname];
}

class RegisterEmailChanged extends UnosoloEvent {
  final BlocFormItem email;
  const RegisterEmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class RegisterPhoneChanged extends UnosoloEvent {
  final BlocFormItem phone;
  const RegisterPhoneChanged({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class RegisterPasswordChanged extends UnosoloEvent {
  final BlocFormItem password;
  const RegisterPasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

class RegisterFormSubmit extends UnosoloEvent{
  const RegisterFormSubmit();
}

class FormReset extends UnosoloEvent{
  const FormReset();
}
