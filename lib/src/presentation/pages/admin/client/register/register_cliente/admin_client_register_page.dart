import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/consulta_dni_content.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/admin_client_register_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminClientRegisterPage extends StatefulWidget {
  const AdminClientRegisterPage({super.key});

  @override
  State<AdminClientRegisterPage> createState() =>
      _AdminClientRegisterPageState();
}

class _AdminClientRegisterPageState extends State<AdminClientRegisterPage> {
  ConsultaDniBloc? _blocDni;
  RegisterClientBloc? _blocRegister;

  @override
  Widget build(BuildContext context) {
    _blocDni = BlocProvider.of<ConsultaDniBloc>(context);
    _blocRegister = BlocProvider.of<RegisterClientBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Cliente'),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<RegisterClientBloc, RegisterClientState>(
              listener: (context, state) {
                final responseState = state.response;
                if (responseState is Error) {
                  Fluttertoast.showToast(
                    msg: responseState.message,
                    toastLength: Toast.LENGTH_LONG);
                }else if( responseState is Success){
                  
                  _blocDni?.add(ResetSunatForm());
                }
              },
            ),
            BlocListener<ConsultaDniBloc, ConsultaDniState>(
              listener: (context, state) {
                final responseState = state.response;
                if (responseState is Error) {
                  Fluttertoast.showToast(
                      msg: responseState.message,
                      toastLength: Toast.LENGTH_LONG);
                }
              },
            ),
          ],
          child: Column(
          children: [
            BlocBuilder<ConsultaDniBloc, ConsultaDniState>(
              builder: (context, stateDni) {
                if (stateDni is Loading) {
                  return Center(child: CircularProgressIndicator());
                }
                
                return ConsultaDniContent(_blocDni,stateDni,);
              },
            ),
            BlocBuilder<RegisterClientBloc, RegisterClientState>(
              builder: (context, state, ) {
              
                return AdminClientRegisterContent(
                  _blocDni, _blocRegister, state
                  
                );
              },
            ),
          ],
        ),
        )     
    );
  }
}
