import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:ceti_labs/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv2.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginContent extends StatelessWidget {
  final LoginBloc? bloc;
  final LoginState state;
  const LoginContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Container(              
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,              
            //color: Colors.amber,     
            child: Column(
              children: [
                _textWelcome(),
                const SizedBox(height: 20,),
                _textDescription(),
              ],
            ),
          ),
          Container(              
            //color: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,          
            child: Column(
              children: [
                _logo(),
                _textIniciar(),
                const SizedBox(height: 20,),
                _textDni(),
                const SizedBox(height: 15,),
                _textPassword(),
                const SizedBox(height: 40,),
                _buttonLogin(),
                _textNotAccount(),
                const SizedBox(height: 15,),
                _buttomRegistrate(context),                    
              ],
            ),
          ),
          _textCiudad(),
          const SizedBox(height: 10,)
        ],                  
      ),
    );
  }

  Widget _textWelcome(){
    return Container(
      alignment: Alignment.centerLeft,
      child: const CustomGradientText(
      text: "Bienvenido\na Ceti Labs",
        style: TextStyle(
          fontSize: 30,
          fontFamily: "Poppins",
          height: 1.2
        ),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 5, 53, 50), Colors.teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
    );
  }

  Widget _textDescription(){
    return const CustomGradientText(
      text: "Compañia Electronica Tecnologica e Informatica S.A.C. - Ceti S.A.C. | Ceti S.A.C.",
      style: TextStyle(
        fontSize: 18,
        fontFamily: "Poppins",
        height: 1.2
      ),
      gradient: LinearGradient(
        colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      ),
    );
  }

  Widget _logo(){
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom: 15),
      //color: Colors.amber,
      width: 160,
      //height: 130,
      child: Image.asset(
        "assets/Backgrounds/logoceti.png",
        fit: BoxFit.contain,
      ),
    );
  }
  Widget _textIniciar(){
    return const CustomGradientText(
      text: "Iniciar Sesion",
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Poppins",
        height: 1.2
      ),
      gradient: LinearGradient(
        colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      ),
    );
  }

  Widget _textDni(){
    return CustomTextFieldV2(
      label: "DNI", 
      colorLabel: Colors.teal,
      //icon: Icons.abc,
      sizeFont: 14,
      svgIconPath: "assets/icons/dni.svg",
      colorBorderFocus: Colors.teal,
      sizeIcon: 20,
      onChanged: (text){
        bloc?.add(DniChanged(dni: BlocFormItem(value: text)));
      },
      validator: (value){
        return state.dni.error;
      },
    );
  }
  Widget _textPassword(){
    return CustomTextFieldV2(
      label: "Password",
      obscureText: true,
      colorLabel: Colors.teal,
      sizeFont: 14,
      svgIconPath: "assets/icons/candado.svg",
      colorBorderFocus: Colors.teal,
      sizeIcon: 25,
      onChanged: (text){
        bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
      },
      validator: (value){
        return state.password.error;
      },
    );
  }
  Widget _buttonLogin(){
    return CustomButtonV2(
      text: "Ingresar",
      colortext: Colors.teal, 
      sizeFont: 18,
      borderWidth: 1,      
      color1: Colors.white,
      color2: Colors.white,
      borderGradientColors: const [Color.fromARGB(255, 8, 109, 109), Color.fromARGB(255, 153, 185, 187)],
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
        bottomLeft: Radius.circular(18),
        bottomRight: Radius.circular(18)
      ),
      letterSpacing: 1,
      onPressed: (){
        if(state.formKey!.currentState!.validate()){
          bloc?.add(LoginSubmit());
        }
        else{
          Fluttertoast.showToast(
            msg: 'El formulario no es valido', toastLength: Toast.LENGTH_LONG
          );
        } 
      },
    );
  }
  Widget _textNotAccount(){
    return Container(
      margin: const EdgeInsets.only(top: 15),
      //color: Colors.red,
      child:const Row(
        children: [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 16),
            child: Text(
              "No tienes cuenta",
            style: TextStyle(
              fontSize: 10,
              color: Color.fromARGB(207, 56, 55, 55),
              ),
            ),
          ),
          Expanded(child: Divider(),),
        ],
      ),
    );
  }

  Widget _buttomRegistrate(BuildContext context){
    return CustomButtonV2(
      text: "Registrate",
      colortext: Colors.teal, 
      sizeFont: 18,                    
      onPressed: (){
        Navigator.pushNamed(context, 'register');
      },
      color1: Colors.white,
      color2: Colors.white,
      borderWidth: 1,
      borderGradientColors: const [Color.fromARGB(255, 8, 109, 109), Color.fromARGB(255, 18, 203, 209)],
      letterSpacing: 1,
    );
  }
  Widget _textCiudad(){
    return Container(
      alignment: Alignment.center,
      child: const CustomGradientText(
        text: "Trujillo - Perú",
        style: TextStyle(
          color: Colors.black,
          //fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 12
        ),
        gradient: LinearGradient(
          colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
    );
  }
}