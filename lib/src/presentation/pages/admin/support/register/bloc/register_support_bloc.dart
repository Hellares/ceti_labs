import 'dart:io';

import 'package:ceti_labs/src/domain/useCases/support/supports_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/bloc/register_support_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/bloc/register_support_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterSupportBloc extends Bloc<RegisterSupportEvent, RegisterSupportState> {
  SupportsUseCases supportsUseCases;
  RegisterSupportBloc(this.supportsUseCases):super(const RegisterSupportState()){
    on<RegisterSupportInitEvent>(_onInitEvent);
    on<DeviceChanged>(_onDeviceChanged);
    on<BrandChanged>(_onBrandChanged);
    on<ComponentAChanged>(_onComponentAChanged);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<FormSubmit>(_onFormSubmit);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(RegisterSupportInitEvent event, Emitter<RegisterSupportState> emit) async {
    emit(
      state.copyWith(
        userId: event.user?.id,
        formKey: formKey
      )
    );
  }

  Future<void> _onDeviceChanged(DeviceChanged event, Emitter<RegisterSupportState> emit) async {
    emit(
      state.copyWith(
        device: BlocFormItem(
          value: event.device.value,
          error: event.device.value.isEmpty ? null : 'Campo obrigatório'
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onBrandChanged(BrandChanged event, Emitter<RegisterSupportState> emit) async {
    emit(
      state.copyWith(
        brand: BlocFormItem(
          value: event.brand.value,
          error: event.brand.value.isEmpty ? null : 'Campo obrigatório'
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onComponentAChanged(ComponentAChanged event, Emitter<RegisterSupportState> emit) async {
    emit(
      state.copyWith(
        componentA: BlocFormItem(
          value: event.componentA.value,
          error: event.componentA.value.isEmpty ? null : 'Campo obrigatório'
        ),
        formKey: formKey
      )
    );
  }

  Future<void> _onPickImage(PickImage event, Emitter<RegisterSupportState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      if(event.numberFile == 1){
        emit(
          state.copyWith(
            file1: File(image.path)
          )
        );
      }
      else if(event.numberFile == 2){
        emit(
          state.copyWith(
            file2: File(image.path)
          )
        );
      }
      else if(event.numberFile == 3){
        emit(
          state.copyWith(
            file3: File(image.path)
          )
        );
      }     
    }
  }

  Future<void> _onTakePhoto(TakePhoto event, Emitter<RegisterSupportState> emit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image != null){
      if(event.numberFile == 1){
        emit(
          state.copyWith(
            file1: File(image.path)
          )
        );
      }
      else if(event.numberFile == 2){
        emit(
          state.copyWith(
            file2: File(image.path)
          )
        );
      }
      else if(event.numberFile == 3){
        emit(
          state.copyWith(
            file3: File(image.path)
          )
        );
      }     
    }
  }

  Future<void> _onFormSubmit(FormSubmit event, Emitter<RegisterSupportState> emit) async {
    emit(
      state.copyWith(
        response: Loading(),
        formKey: formKey
      )
    );

    List<File> files = [];
    if (state.file1 != null) files.add(state.file1!);
    if (state.file2 != null) files.add(state.file2!);
    if (state.file3 != null) files.add(state.file3!);

    Resource response = await supportsUseCases.register.run(state.toSupport(), files);
    emit(
      state.copyWith(
        response: response,
        formKey: formKey
      )
    );
  }
}