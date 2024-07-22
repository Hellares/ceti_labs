import 'dart:io';

import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminRegisterDeviceState extends Equatable{
  final BlocFormItem name;
  final File? file;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const AdminRegisterDeviceState({
    this.name = const BlocFormItem(error: 'Ingresa el Dispositivo'),
    this.file,
    this.formKey,
    this.response
  });

  toDevice()=> Device(name: name.value);
  
  AdminRegisterDeviceState resetForm(){
    return AdminRegisterDeviceState(
      name: const BlocFormItem(error: 'Ingresa el Dispositivo'),
    );
  }
  
  AdminRegisterDeviceState copyWith({
    BlocFormItem? name,
    File? file,
    GlobalKey<FormState>? formKey,
    Resource? response
  }){
    return AdminRegisterDeviceState(
      name: name ?? this.name,
      file: file ?? this.file,
      formKey: formKey,
      response: response
    );
  } 
  
  @override
  List<Object?> get props => [name,file, response];
  
}