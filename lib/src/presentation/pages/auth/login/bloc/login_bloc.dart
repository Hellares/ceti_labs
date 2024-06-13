import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {

  AuthUseCases authUseCases;

    LoginBloc(this.authUseCases) : super(LoginState()){
    on<InitEvent>(_onInitEvent);
    on<DniChanged>(_onDniChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onLoginSubmit);
    on<LoginFormReset>(_onLoginFormReset);
    on<LoginSaveUserSession>(_onLoginSaveUserSession);
  }

  final formKey = GlobalKey<FormState>();

  Future<void>_onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    //print('usario de sesion: ${authResponse?.toJson()}');
    emit(
      state.copyWith(formKey: formKey),
    );
    if(authResponse != null){ //usuario no ah iniciado sesion
      emit(
        state.copyWith(
          response: Success(authResponse), //  authresponse -> user y el token
          formKey: formKey
        )
      );
    }
  }

  Future<void>_onLoginSaveUserSession(LoginSaveUserSession event, Emitter<LoginState> emit) async {
    await authUseCases.saveUserSession.run(event.authResponse);
  }

  Future<void>_onLoginFormReset(LoginFormReset event, Emitter<LoginState> emit) async {
    state.formKey?.currentState?.reset();
  }

  Future<void>_onDniChanged(DniChanged event, Emitter<LoginState> emit) async {
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

  Future<void>_onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error:  event.password.value.isNotEmpty && event.password.value.length <= 6  ? null : 'Minimo 6 caracteres'
        ),
        formKey: formKey
      )
    );
  }

  Future<void>_onLoginSubmit(LoginSubmit event, Emitter<LoginState> emit) async {
    emit( 
      state.copyWith( 
        response: Loading(),
        formKey: formKey,
        ),
      );
    Resource response =  await authUseCases.login.run(state.dni.value, state.password.value);
    emit( 
      state.copyWith( 
        response: response,
        formKey: formKey
      )
    );
  }
}
