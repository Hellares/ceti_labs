
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/register_client_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv2.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv3.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminClientRegisterContent extends StatelessWidget {

  final ConsultaDniBloc? blocconsultaDni;
  final RegisterClientBloc? blocregisterClient;
  final RegisterClientState state ;


  const AdminClientRegisterContent(
    this.blocconsultaDni,
    this.blocregisterClient, 
    this.state,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {

    return Form(
      key: state.formKey,
      child: Column(
        children: [
          SizedBox(height: 30,),
          CustomGradientText(
            text: 'Datos del Cliente', 
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Poppins",
              height: 1.2
            ),
            gradient: LinearGradient(colors: const [Color.fromARGB(255, 4, 97, 91), Color.fromARGB(255, 21, 156, 147)]) 
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFieldV3(
              label: 'Nro Dni',
              colorLabel: Colors.teal,
              onChanged: (text){
                blocregisterClient?.add(RegisterDniChanged(dni: BlocFormItem(value: text)));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomTextFieldV3(
              label: 'Nombres',
              colorLabel: Colors.teal,
              onChanged: (text){
                blocregisterClient?.add(RegisterNameChanged(name: BlocFormItem(value: text)));
              },
              //initialValue: '-'
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFieldV3(
              label: 'Apellidos',
              colorLabel: Colors.teal,
              onChanged: (text){
                blocregisterClient?.add(RegisterLastnameChanged(lastname: BlocFormItem(value: text)));
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomTextFieldV3(
              label: 'Correo Electronico',
              colorLabel: Colors.teal,
              onChanged: (text){
                blocregisterClient?.add(RegisterEmailChanged(email: BlocFormItem(value: text)));
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFieldV3(
              label: 'Telefono',
              colorLabel: Colors.teal,
              onChanged: (text){
                blocregisterClient?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text)));
              }
            ),
          ),
  
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomButtonV2(
              text: 'Registrar',
              colortext: Colors.teal,
              color1: Colors.white,
              color2: Colors.white,
              borderWidth: 1,
              sizeFont: 18,                    
              onPressed: (){
                if(state.formKey!.currentState!.validate()){
                  blocregisterClient?.add(RegisterFormSubmit());
                }else{
                  Fluttertoast.showToast(msg: 'Ingrese todos los datos', toastLength: Toast.LENGTH_LONG);
                }
              },
            ),
          )
        ],
      )
    );
  }
}
