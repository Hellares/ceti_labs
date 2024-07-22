
import 'package:ceti_labs/src/widgets/custom_buttonv2.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv2.dart';
import 'package:ceti_labs/src/widgets/icon_customback.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(179, 255, 255, 255),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,          
          child:  Padding(            
            padding:  const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Column(
              children: [
                const Row(
                  children: [
                    IconCustomBack(
                      svgPath: "assets/icons/flecha.svg",
                    ),
                    CustomGradientText(
                      text: "Registrarse",
                        style: TextStyle(
                        //fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        gradient: LinearGradient(
                        colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                    ),
                  ],
                ),               
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 130,
                          ),
                          const CustomGradientText(
                            text: "Ingrese su Informacion",
                              style: TextStyle(
                                fontSize: 18,
                                //fontFamily: "Poppins",
                                fontWeight: FontWeight.w700
                                //height: 1.2
                              ),
                              gradient: LinearGradient(
                              colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                            ),
                          ),
                          const SizedBox(height: 18,),
                          CustomTextFieldV2(
                            label: "Numero DNI",
                            sizeFont: 14,
                            svgIconPath: "assets/icons/dni.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 15,),
                          CustomTextFieldV2(
                            label: "Nombres",
                            sizeFont: 14,
                            svgIconPath: "assets/icons/names.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 15,),
                          CustomTextFieldV2(
                            label: "Apellidos",
                            sizeFont: 14,
                            svgIconPath: "assets/icons/names.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 15,),
                          CustomTextFieldV2(
                            label: "Telefono",
                            sizeFont: 14,
                            svgIconPath: "assets/icons/phone.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 15,),
                          CustomTextFieldV2(
                            label: "Email",
                            sizeFont: 14,
                            svgIconPath: "assets/icons/email1.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 15,),
                          CustomTextFieldV2(
                            label: "Contraseña",
                            sizeFont: 14,
                            svgIconPath: "assets/icons/contraseña.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 15,),
                          CustomTextFieldV2(
                            label: "Confirmar Contraseña",
                            sizeFont: 14,
                            obscureText: true,
                            svgIconPath: "assets/icons/verificar.svg",
                            colorLabel: Colors.teal,
                            onChanged: (value){}
                          ),
                          const SizedBox(height: 20,),
                          CustomButtonV2(
                            text: "Registrarse",
                            colortext: const Color.fromARGB(255, 255, 255, 255), 
                            sizeFont: 16,                    
                            onPressed: (){                              
                            },
                            color1: const Color.fromARGB(255, 10, 121, 97),
                            color2: const Color.fromARGB(255, 6, 172, 158),
                            borderWidth: 1,
                            borderGradientColors: const [Color.fromARGB(255, 8, 109, 109), Color.fromARGB(255, 18, 203, 209)],
                            letterSpacing: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],              
            ),
          ),              
        ),
      
      ),
    );
    
  }
}