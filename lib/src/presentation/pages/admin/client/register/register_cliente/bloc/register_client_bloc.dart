
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_state.dart';

import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterClientBloc extends Bloc<RegisterClientEvent, RegisterClientState> {
  AuthUseCases authUseCases;
  RegisterClientBloc(this.authUseCases) : super(RegisterClientState()){
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterDniChanged>(_onDniChanged);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterLastnameChanged>(_onLastnameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterFormSubmit>(_onRegisterFormSubmit);
    on<FormReset>(_onFormReset);
  }
  
  final formKey = GlobalKey<FormState>();


  Future<void>_onInitEvent(RegisterInitEvent event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(formKey: formKey)
    );
  }

  Future<void>_onDniChanged(RegisterDniChanged event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(
        dni: BlocFormItem(
          value: event.dni.value,
          error: event.dni.value.isNotEmpty ? null : 'Ingresa el numero de DNI'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onNameChanged(RegisterNameChanged event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingresa sus Nombres'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onLastnameChanged(RegisterLastnameChanged event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isNotEmpty ? null : 'Ingresa sus Nombres y apellidos'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onEmailChanged(RegisterEmailChanged event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isNotEmpty ? null : 'Ingresa su email'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onPhoneChanged(RegisterPhoneChanged event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? null : 'Ingresa su numero de telefono'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterClientState> emit) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isNotEmpty  ? null : 'Ingresa su contraseña'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onRegisterFormSubmit(RegisterFormSubmit event, Emitter<RegisterClientState> emit) async {
    emit( 
      state.copyWith( 
        response: Loading(),
        formKey: formKey,
        ),
      );
    Resource response =  await authUseCases.register.run(state.toUser());
    emit( 
      state.copyWith( 
        response: response,
        formKey: formKey
      )
    );
  }

  Future<void>_onFormReset(FormReset event, Emitter<RegisterClientState> emit) async {
    state.formKey?.currentState?.reset();
  }

}
