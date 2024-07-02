

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

class AdminClientRegisterContent extends StatefulWidget {

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
  State<AdminClientRegisterContent> createState() => _AdminClientRegisterContentState();
}


class _AdminClientRegisterContentState extends State<AdminClientRegisterContent> {

  late TextEditingController numeroDniController;
  late TextEditingController nombresController;
  late TextEditingController apellidosController;

  @override
  void initState() {
    super.initState();
    
    numeroDniController = TextEditingController(text: widget.blocconsultaDni!.state.numberDni ?? '');
    nombresController = TextEditingController(text: widget.blocconsultaDni!.state.nombres ?? '');
    apellidosController = TextEditingController(text: widget.blocconsultaDni!.state.apellidos ?? '');

    widget.blocconsultaDni?.stream.listen((state) {

        numeroDniController.text = state.numberDni ?? '';
        nombresController.text = state.nombres ?? '';
        apellidosController.text = state.apellidos ?? '';
      
    }, onError: (error){
      print('Error in blocregisterClient stream: $error');
    });
  }

  @override
  void dispose() {
    super.dispose();

    
  }

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: widget.state.formKey,
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
              controller: numeroDniController,
              label: 'Nro Dni',
              colorLabel: Colors.teal,
              onChanged: (text){
                //widget.blocregisterClient?.add(RegisterDniChanged(dni: BlocFormItem(value: text)));
              
              },
              enabled: true,
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomTextFieldV3(
              controller: nombresController,
              label: 'Nombres',
              colorLabel: Colors.teal,
              onChanged: (text){
                //widget.blocregisterClient?.add(RegisterNameChanged(name: BlocFormItem(value: text)));
              },
              enabled: true,
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFieldV3(
              controller: apellidosController,
              label: 'Apellidos',
              colorLabel: Colors.teal,
              onChanged: (text){
                //widget.blocregisterClient?.add(RegisterLastnameChanged(lastname: BlocFormItem(value: text)));
              },
              enabled: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: CustomTextFieldV3(
              label: 'Correo Electronico',
              colorLabel: Colors.teal,
              onChanged: (text){
                widget.blocregisterClient?.add(RegisterEmailChanged(email: BlocFormItem(value: text)));
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFieldV3(
              label: 'Telefono',
              colorLabel: Colors.teal,
              onChanged: (text){
                widget.blocregisterClient?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text)));
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
                final numberDni = numeroDniController.text;
                final nombres = nombresController.text;
                final apellidos = apellidosController.text;
                widget.blocregisterClient?.add(RegisterDniChanged(dni: BlocFormItem(value: numberDni)));
                widget.blocregisterClient?.add(RegisterNameChanged(name: BlocFormItem(value: nombres)));
                widget.blocregisterClient?.add(RegisterLastnameChanged(lastname: BlocFormItem(value: apellidos)));
                if(widget.state.formKey!.currentState!.validate()){
                  widget.blocregisterClient?.add(RegisterFormSubmit());            
                }else{
                  Fluttertoast.showToast(msg: 'Ingrese todos los datos', toastLength: Toast.LENGTH_LONG);
                }
              },
            ),
          ),
          
        ],
      )
    );
  }
}



