

import 'package:flutter/material.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/unosolo_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/unosolo_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/register_cliente/bloc/unosolo_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv2.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv3.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv3.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RContente extends StatefulWidget {
  final UnoSoloBloc? blocUnosolo;
  final UnosoloState state;
  const RContente(this.blocUnosolo, this.state, {super.key});

  @override
  State<RContente> createState() => _RContenteState();
}

class _RContenteState extends State<RContente> {
  late TextEditingController numeroDniController;
  late TextEditingController nombresController;
  late TextEditingController apellidosController;
  @override
  void initState() {
    super.initState();
    numeroDniController = TextEditingController(text: widget.state.dni?.value ?? '');
    nombresController = TextEditingController(text: widget.state.name.value);
    apellidosController = TextEditingController(text: widget.state.lastname.value);

    widget.blocUnosolo?.stream.listen((state) {
      if (mounted) {
        //setState(() {
          numeroDniController.text = state.dni?.value ?? '';
          nombresController.text = state.name.value;
          apellidosController.text = state.lastname.value;
        //});
      }
    }, onError: (error) {
      //print('Error in blocregisterClient stream: $error');
    }); 
    

  }
  @override
    void dispose() {
      numeroDniController.dispose();
      nombresController.dispose();
      apellidosController.dispose();
      widget.blocUnosolo?.add(FormReset());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextFieldV3(
                        label: 'Nro Dni',
                        colorLabel: Colors.teal,
                        onChanged: (text) {
                          widget.blocUnosolo?.add(NumberDniSearchChanged(numberDniSearch:BlocFormItem(value: text)));
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  CustomButtonV3(
                    text: 'Consultar',
                    color1: Colors.white,
                    color2: Colors.white,
                    borderGradientColors: const [Colors.black, Colors.black],
                    borderWidth: 1,
                    onPressed: () {
                      widget.blocUnosolo?.add(ButtonPressedSearch());

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Form(
          key: widget.state.formKey,
          child: Column(
          children: [
            SizedBox( height: 30,),
            CustomGradientText(
                text: 'Datos del Cliente',
                style:
                    TextStyle(fontSize: 20, fontFamily: "Poppins", height: 1.2),
                gradient: LinearGradient(colors: const [
                  Color.fromARGB(255, 4, 97, 91),
                  Color.fromARGB(255, 21, 156, 147)
                ])),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextFieldV3(
                controller: numeroDniController,
                label: 'Nro Dni',
                colorLabel: Colors.teal,
                onChanged: (text) {
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
                onChanged: (text) {
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
                onChanged: (text) {
                },                
                enabled: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: CustomTextFieldV3(
                  
                  label: 'Correo Electronico',
                  colorLabel: Colors.teal,
                  onChanged: (text) {
                    widget.blocUnosolo?.add(RegisterEmailChanged(email: BlocFormItem(value: text)));
                  }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextFieldV3(
                  label: 'Telefono',
                  colorLabel: Colors.teal,
                  onChanged: (text) {
                    widget.blocUnosolo?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text)));
                  }),
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
                onPressed: () {
                  if(widget.state.formKey!.currentState!.validate()){
                  widget.blocUnosolo?.add(RegisterFormSubmit());
                  widget.blocUnosolo?.add(FormReset());
                    //Navigator.pop(context);
                  }else{
                    Fluttertoast.showToast(msg: 'Ingrese todos los datos', toastLength: Toast.LENGTH_LONG);
                  }
                } 
              ),
            ),
          ],
        )),
      ],
    );
  }
}
