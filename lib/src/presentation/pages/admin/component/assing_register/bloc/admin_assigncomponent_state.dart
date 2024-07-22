
import 'package:ceti_labs/src/domain/models/component_device_response.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminAssignComponentState extends Equatable{
  //final BlocFormItem idDevice;
  final String? idDevice;
  final BlocFormItem componentName;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  const AdminAssignComponentState({
    this.idDevice,
    this.componentName = const BlocFormItem(error: 'Ingresa el nombre del componente'),
    this.formKey,
    this.response,
  });

  toComponent() => Component(
    id: idDevice! as int,
    name: componentName.value,
  );
  
  AdminAssignComponentState copyWith({
    String? idDevice,
    BlocFormItem? componentName,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }){
    return AdminAssignComponentState(
      idDevice: idDevice,
      componentName: componentName ?? this.componentName,
      formKey: formKey ?? this.formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [idDevice, componentName, formKey, response];
}