
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/admin_register_support_content.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/bloc/register_support_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/bloc/register_support_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminRegisterSupportPage extends StatefulWidget {
  const AdminRegisterSupportPage({super.key});

  @override
  State<AdminRegisterSupportPage> createState() => _AdminRegisterSupportPageState();
}

class _AdminRegisterSupportPageState extends State<AdminRegisterSupportPage> {
  RegisterSupportBloc? _bloc;
  User? user;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _bloc?.add(RegisterSupportInitEvent(user: user));
    // });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<RegisterSupportBloc>(context);
    user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Servicio Tecnico'),
      ),
      body: BlocListener<RegisterSupportBloc, RegisterSupportState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Error) {            
            Fluttertoast.showToast(
              msg: 'Error al registrar el servicio tecnico',
              toastLength: Toast.LENGTH_LONG);              
          }else if( responseState is Success){
            
          }
        },
        child: BlocBuilder<RegisterSupportBloc, RegisterSupportState>(
          builder: (context, state) {
            //final responseState = state.response;
            // if (responseState is Loading) {
            //   Center(child: CircularProgressIndicator());
            // }
            return AdminRegisterSupportContent(_bloc, state, user);
          },
        )
      )
    
      
    );
  }
}