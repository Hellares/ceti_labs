import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceti_labs/src/domain/useCases/devices/devices_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:image_picker/image_picker.dart';

class AdminRegisterDeviceBloc extends Bloc<AdminRegisterDeviceEvent, AdminRegisterDeviceState>{
  DevicesUseCases devicesUseCases;
  AdminRegisterDeviceBloc(this.devicesUseCases): super(AdminRegisterDeviceState()){
    on<AdminRegisterDeviceInitEvent>(_onInitEvent);
    on<NameChanged>(_onNameChanged);
    on<FormSubmit>(_onFormSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(AdminRegisterDeviceInitEvent event, Emitter<AdminRegisterDeviceState> emit) async{
    emit(
      state.copyWith(
        formKey: formKey,
      )      
    );
  }

  Future<void> _onNameChanged(NameChanged event, Emitter<AdminRegisterDeviceState> emit) async{
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingrese el nombre'
        ),
        formKey: formKey,
      )
    );
  }

  Future<void> _onPickImage(PickImage event, Emitter<AdminRegisterDeviceState> emit) async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      emit(
        state.copyWith(
          file: File(image.path),
          formKey: formKey
        )
      );
    }
  }

  Future<void> _onTakePhoto(TakePhoto event, Emitter<AdminRegisterDeviceState> emit) async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image != null){
      emit(
        state.copyWith(
          file: File(image.path),
          formKey: formKey
        )
      );
    }
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<AdminRegisterDeviceState> emit) async{
    emit(
      state.copyWith(
        response: Loading(),
        formKey: formKey,
      )
    );
    Resource response = await devicesUseCases.registerDevice.run(state.toDevice(), state.file!);
    emit(
      state.copyWith(
        response: response,
        formKey: formKey,
      )
    );
  }

  Future<void> _onResetForm(ResetForm event, Emitter<AdminRegisterDeviceState> emit) async{
    
    emit(
      state.resetForm()
    );
  }
}