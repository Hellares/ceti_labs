import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_event.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv3.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv3.dart';
import 'package:flutter/material.dart';

class ConsultaDniContent extends StatelessWidget {
  final ConsultaDniBloc? bloc;
  final ConsultaDniState state;


  const ConsultaDniContent(this.bloc, this.state,  {super.key,});

  @override
  Widget build(BuildContext context) {

    return Container(
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
                      bloc?.add(DniChangedSunat(numberDni: BlocFormItem(value: text)));
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
                  bloc?.add(ButtonPressed());
                },
              ), 
            ],
          ), 
          
          // CustomTextFieldV3(
          //   controller: TextEditingController(text: state.nombres),
          //   label: 'nombres',
          //   onChanged: (text) {}
          // )
        ],
      ),
    );
  }
}

