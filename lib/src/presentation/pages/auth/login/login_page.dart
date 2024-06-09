import 'package:ceti_labs/src/widgets/custom_buttonv2.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv2.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            Container(              
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,     
              //color: Colors.amber,     
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const CustomGradientText(
                    text: "Bienvenido\na Ceti Labs",
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: "Poppins",
                      height: 1.2
                    ),
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 5, 53, 50), Colors.teal],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                  ),
                  ),
                  const SizedBox(height: 20,),
                  const CustomGradientText(
                    text: "Compañia Electronica Tecnologica e Informatica S.A.C. - Ceti S.A.C. | Ceti S.A.C.",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      height: 1.2
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                  ),
                ],
              ),
            ),
            Container(              
              //color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65,          
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    //color: Colors.amber,
                    width: 200,
                    height: 130,
                    child: Image.asset(
                      "assets/Backgrounds/logoceti.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const CustomGradientText(
                    text: "Iniciar Sesion",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Poppins",
                      height: 1.2
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFieldV2(
                    label: "DNI", 
                    colorLabel: Colors.teal,
                    //icon: Icons.abc,
                    sizeFont: 20,
                    svgIconPath: "assets/icons/dni.svg",
                    colorBorderFocus: Colors.teal,
                    sizeIcon: 20,
                    onChanged: (value){},
                  ),
                  const SizedBox(height: 25,),
                  CustomTextFieldV2(
                    label: "Password",
                    obscureText: true,
                    colorLabel: Colors.teal,
                    sizeFont: 20,
                    svgIconPath: "assets/icons/candado.svg",
                    colorBorderFocus: Colors.teal,
                    sizeIcon: 25,
                    onChanged: (value){},
                  ),
                  const SizedBox(height: 40,),
                  CustomButtonV2(
                    text: "Ingresar",
                    colortext: Colors.teal, 
                    sizeFont: 25,
                    borderWidth: 1,
                    onPressed: (){},
                    color1: Colors.white,
                    color2: Colors.white,
                    borderGradientColors: const [Color.fromARGB(255, 8, 109, 109), Color.fromARGB(255, 153, 185, 187)],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)
                    ),
                    letterSpacing: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    //color: Colors.red,
                    child:const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric( horizontal: 16),
                          child: Text(
                            "No tienes cuenta",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(207, 56, 55, 55),
                            ),
                          ),
                        ),
                        Expanded(child: Divider(),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CustomButtonV2(
                    text: "Registrate",
                    colortext: Colors.teal, 
                    sizeFont: 25,                    
                    onPressed: (){
                      Navigator.pushNamed(context, 'register');
                    },
                    color1: Colors.white,
                    color2: Colors.white,
                    borderWidth: 1,
                    borderGradientColors: const [Color.fromARGB(255, 8, 109, 109), Color.fromARGB(255, 18, 203, 209)],
                    letterSpacing: 2,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const CustomGradientText(
                text: "Trujillo - Perú",
                style: TextStyle(
                  color: Colors.black,
                  //fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
                gradient: LinearGradient(
                  colors: [Colors.teal, Color.fromARGB(255, 5, 53, 50)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
              ),
            )
          ],                  
        ),
      ),
    );
  }
}