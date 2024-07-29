import 'dart:io';

import 'package:ceti_labs/src/domain/models/support.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterSupportState  extends Equatable{
  final BlocFormItem device;
  final BlocFormItem brand;
  final BlocFormItem componentA;
  final int userId;
  final GlobalKey<FormState>? formKey;
  final File? file1;
  final File? file2;
  final File? file3;
  final Resource? response;
  
  const RegisterSupportState({
    this.device = const BlocFormItem(error: 'Ingrese el nombre del dispositivo'),
    this.brand = const BlocFormItem(error: 'Ingrese el nombre del fabricante'),
    this.componentA = const BlocFormItem(error: 'Ingrese el nombre del componente A'),
    this.userId = 0,
    this.file1,
    this.file2,
    this.file3,
    this.formKey,
    this.response,
  });

  toSupport() => Support(
    device: device.value,
    brand: brand.value,
    componentA: componentA.value,
    userId: userId,
  );

  RegisterSupportState copyWith({
    BlocFormItem? device,
    BlocFormItem? brand,
    BlocFormItem? componentA,
    int? userId,
    int? statusId,
    File? file1,
    File? file2,
    File? file3,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return RegisterSupportState(
      device: device ?? this.device,
      brand: brand ?? this.brand,
      componentA: componentA ?? this.componentA,
      userId: userId ?? this.userId,
      file1: file1 ?? this.file1,
      file2: file2 ?? this.file2,
      file3: file3 ?? this.file3,
      formKey: formKey,
      response: response,
    );
  }
  
  @override
  List<Object?> get props => throw [device, brand, componentA, userId, file1, file2, file3, response];

}