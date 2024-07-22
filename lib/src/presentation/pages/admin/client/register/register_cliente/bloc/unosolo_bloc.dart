
import 'package:ceti_labs/src/domain/models/auth_response_register.dart';
import 'package:ceti_labs/src/domain/models/sunat_response.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/domain/useCases/sunat/sunat_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/unosolo_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/unosolo_state.dart';

import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnoSoloBloc extends Bloc<UnosoloEvent, UnosoloState> {
  SunatUseCases sunatUseCases;
  AuthUseCases authUseCases;
  UnoSoloBloc(this.sunatUseCases, this.authUseCases) : super(UnosoloState()){
    on<UnosoloInitEvent>(_onInitEvent);
    on<ButtonPressedSearch>(_onButtonPressedSearch);
    on<NumberDniSearchChanged>(_onNumberDniSearchChanged);
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


  Future<void>_onInitEvent(UnosoloInitEvent event, Emitter<UnosoloState> emit) async {
    emit(
      state.copyWith(formKey: formKey)
    );
  }
  Future<void>_onNumberDniSearchChanged(NumberDniSearchChanged event, Emitter<UnosoloState> emit) async {
    
    emit(
      state.copyWith(
        numberDniSearch: BlocFormItem(
          value: event.numberDniSearch.value,
          error: event.numberDniSearch.value.isNotEmpty ? null : 'Ingresa el numero de DNI'
        ),
        formKey: formKey,
        response: Loading()
      )
    );
  }

  Future<void> _onButtonPressedSearch(ButtonPressedSearch event, Emitter<UnosoloState> emit) async {
    emit(
      state.copyWith(
        response: Loading()
      )
    );
    Resource<SunatResponse> sunatResponse = await sunatUseCases.getDataDni.run(state.numberDniSearch.value);
    if(sunatResponse is Success<SunatResponse>) {
      //print(sunatResponse.data.toJson());
      emit(
        state.copyWith(
          dni: BlocFormItem(
            value: sunatResponse.data.data.numero,
            error: 'Ingresa el numero de DNI'
          ),
          name: BlocFormItem(
            value: sunatResponse.data.data.nombres,
            error: 'Ingresa sus Nombres',
          ),
          lastname: BlocFormItem(
            value: '${sunatResponse.data.data.apellidoPaterno} ${sunatResponse.data.data.apellidoMaterno}',
            error: 'Ingresa sus Apellidos'
          ),          
          response: sunatResponse,
          formKey: formKey
          ),
        
      );

    }else if(sunatResponse is Error){
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: '',
            error: 'Error al obtener los datos del DNI'
          ),
          lastname: BlocFormItem(
            value: '',
            error: 'Error al obtener los datos del DNI'
          ),
          response: sunatResponse
        )
      );
    }
  }

  Future<void>_onDniChanged(RegisterDniChanged event, Emitter<UnosoloState> emit) async {
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

  Future<void>_onNameChanged(RegisterNameChanged event, Emitter<UnosoloState> emit) async {
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

  Future<void>_onLastnameChanged(RegisterLastnameChanged event, Emitter<UnosoloState> emit) async {
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

  Future<void>_onEmailChanged(RegisterEmailChanged event, Emitter<UnosoloState> emit) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isNotEmpty ? '' : 'Ingresa su email'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onPhoneChanged(RegisterPhoneChanged event, Emitter<UnosoloState> emit) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? '' : 'Ingresa su numero de telefono'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onPasswordChanged(RegisterPasswordChanged event, Emitter<UnosoloState> emit) async {
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

  Future<void>_onRegisterFormSubmit(RegisterFormSubmit event, Emitter<UnosoloState> emit) async {
    emit( 
      state.copyWith( 
        response: Loading(),
        formKey: formKey,
        ),
      );
    Resource response =  await authUseCases.register.run(state.toUser());
    if(response is Success<AuthResponseRegister>){
      emit( 
        state.copyWith( 
          response: response,
          formKey: formKey
        )
      );
    }else if(response is Error){
      emit( 
        state.copyWith( 
          response: response,
          formKey: formKey
        )
      );
    }
  }

  Future<void>_onFormReset(FormReset event, Emitter<UnosoloState> emit) async {
    //state.formKey?.currentState?.reset();
    formKey.currentState?.reset();
    //emit(state.copyWith(formKey: formKey));
    emit(state.copyWith(
      numberDniSearch: BlocFormItem(
        value: ''
      ),
      dni: BlocFormItem(
        value: ''
      ),
      name: BlocFormItem(
        value: ''
      ),
      lastname: BlocFormItem(
        value: ''
      ),
      email: BlocFormItem(
        value: ''
      ),
      phone: BlocFormItem(
        value: ''
      ),
      formKey: formKey
    ));
  }

}
