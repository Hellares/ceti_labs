
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class LoginState extends Equatable {

  final BlocFormItem dni;
  final BlocFormItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.dni = const BlocFormItem(error: 'Ingresa el DNI'),
    this.password = const BlocFormItem(error: 'Ingresa tu contraseña'),
    this.formKey,
    this.response
  });

  LoginState copyWith({
    BlocFormItem? dni,
    BlocFormItem? password,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }){
    return LoginState(
      dni: dni ?? this.dni,
      password:  password ?? this.password,
      formKey: formKey,
      response: response
    );
  }

  @override
  List<Object?> get props => [dni,password,response];
}
