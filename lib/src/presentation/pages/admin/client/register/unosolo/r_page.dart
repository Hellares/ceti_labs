import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/unosolo/bloc/unosolo_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/unosolo/bloc/unosolo_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/unosolo/r_contente.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RPage extends StatefulWidget {
  const RPage({super.key});

  @override
  State<RPage> createState() => _RPageState();
}

class _RPageState extends State<RPage> {
  UnoSoloBloc? _blocUnosolo;

  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    _blocUnosolo = BlocProvider.of<UnoSoloBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Cliente'),
      ),
      body: BlocListener<UnoSoloBloc,UnosoloState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Error) {
            
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG);
              
          }else if( responseState is Success){

          }
        },
        child: BlocBuilder<UnoSoloBloc,UnosoloState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              Center(child: CircularProgressIndicator());
            }
            return RContente(_blocUnosolo, state);
          },
        ) 
      )
    );
  }
}