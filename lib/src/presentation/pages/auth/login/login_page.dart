import 'package:ceti_labs/src/domain/models/auth_response.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/login_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  void initState() {
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Error) {
              Fluttertoast.showToast(
                  msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            } else if (responseState is Success) {
              final authResponse = responseState.data as AuthResponse;
              //print({authResponse.user.dni.toString()});
              //_bloc?.add(LoginFormReset());              
              _bloc?.add(LoginSaveUserSession(authResponse: authResponse));
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
              });             
              
            }
          },
          child: BlocBuilder<LoginBloc,LoginState>(
            builder: (context, state){
              final responseState = state.response;
              if(responseState is Loading){                  
                //return Stack(
                  //children: [
                    LoginContent(_bloc, state);
                    Center(child: CircularProgressIndicator(),);
                 // ]  
               // );
              }
              return LoginContent(_bloc, state);
            } 
          ),
        ),
      ),
    );
  }
}