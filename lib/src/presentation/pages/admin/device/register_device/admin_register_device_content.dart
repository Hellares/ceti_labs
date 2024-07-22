import 'package:ceti_labs/src/widgets/custom_buttonv3.dart';
import 'package:flutter/material.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:ceti_labs/src/presentation/utils/select_option_image_dialog.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_state.dart';

import 'package:ceti_labs/src/widgets/custom_textfieldv3.dart';


class AdminRegisterDeviceContent extends StatelessWidget {
  final AdminRegisterDeviceBloc? bloc;
  final AdminRegisterDeviceState state;
  const AdminRegisterDeviceContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          //_textDevice(),
          _imageDevice(context, state),
          Container(
            margin: EdgeInsets.only(right: 45,left: 45),
            child: _textName()
          ),
          _buttom(),
        ],
      ),
    );
  }

  Widget _imageDevice(BuildContext context, AdminRegisterDeviceState state){
    return GestureDetector(
      onTap: (){
        selectOptionImageDialog(
          context, 
          () { bloc?.add(PickImage()); },           
          () { bloc?.add(TakePhoto()); }
        );
      },
      child: Container(        
        width: 220,
        margin: EdgeInsets.only(top: 50,bottom: 30),      
        child: AspectRatio(
          aspectRatio: 1/1,
          child: state.file != null
          ? Image.file(
            state.file!,
            fit: BoxFit.cover,
          )
          : Image.asset('assets/img/no-image.png', fit: BoxFit.cover,)
        ),
      ),
    );
  }

  Widget _textName(){
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: CustomTextFieldV3(
        keyboardType: TextInputType.text,
        colorLabel: Colors.green,
        colorFont: Color.fromARGB(255, 3, 101, 182),
        onChanged: (text){
          bloc?.add(NameChanged(name: BlocFormItem(value: text)));
        },
        label: 'Dispositivo', 
        validator: (value){
          return state.name.error;
        },
      ),
    );
  }

  Widget _buttom(){    
    return CustomButtonV3(
      text: ' Registrar Dispositivo ',
      colortext: Color.fromARGB(255, 74, 74, 75),
      fontFamily: 'Araboto Normal 400',              
      color1: Colors.white,
      color2: Colors.white,
      borderWidth: 1,
      borderRadius: BorderRadius.circular(14),
      onPressed: () {
        if(state.formKey!.currentState!.validate()){
          bloc?.add(FormSubmit());
        }
        
      },
    );
  }
}

