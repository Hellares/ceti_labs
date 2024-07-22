

import 'package:ceti_labs/src/domain/models/user_register.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UnosoloState extends Equatable{
  final BlocFormItem numberDniSearch;
  final BlocFormItem? dni;
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem? email;
  final BlocFormItem? phone;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const UnosoloState({
    this.numberDniSearch = const BlocFormItem(error: 'Ingresa tu DNI'),
    this.dni = const BlocFormItem(error: 'Ingresa tu DNI'),
    this.name = const BlocFormItem(error: 'Ingresa tu nombre'),
    this.lastname = const BlocFormItem(error: 'Ingresa tu apellido'),
    this.email = const BlocFormItem(error: 'Ingresa tu email'),
    this.phone = const BlocFormItem(error: 'Ingresa tu telefono'),
    this.password = const BlocFormItem(error: 'Ingresa tu contraseña'),
    this.formKey,
    this.response,
  });
  
    toUser() => UserRegister(
    dni: dni?.value, 
    name: name.value,
    lastname: lastname.value, 
    email: email?.value, 
    phone: phone?.value,
    password: dni?.value,
    
  );

  UnosoloState copyWith({
    BlocFormItem? numberDniSearch,
    BlocFormItem? dni,
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return UnosoloState(
      numberDniSearch: numberDniSearch ?? this.numberDniSearch,
      dni: dni ?? this.dni,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      formKey: formKey ?? this.formKey,
      response: response ?? this.response,
    );
  }

    
  @override
  List<Object?> get props => [numberDniSearch, dni, name,lastname, email, phone, password, formKey, response];
}