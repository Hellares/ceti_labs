
import 'package:ceti_labs/src/domain/models/role.dart';
import 'package:ceti_labs/src/widgets/custom_gradient_text.dart';
import 'package:flutter/material.dart';

class RolesItem extends StatelessWidget {
  final Role role;
  //final String placeholder;
  const RolesItem(this.role,{super.key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      //Navigator.pushNamedAndRemoveUntil(context, role.route, (route) => false);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 10), // cambios de posición de la sombra
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: 5,),
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                image: NetworkImage(role.image),
                fit: BoxFit.cover,
                fadeInDuration: Duration(seconds: 2),
                placeholder: AssetImage('assets/img/no-image.png'),
                //placeholder: SvgPicture.asset("assets/img/no-image.svg"),
              ),
            ),
          ),
          getCustomGradientTextForRole(role.name),
          SizedBox(height: 35,)
        ],
      ),
    );
  }
}

Widget getCustomGradientTextForRole(String roleName) {
  TextStyle adminStyle = TextStyle(
    fontFamily: "pirulen",
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  Gradient adminGradient = LinearGradient(
    colors:const [Color.fromARGB(255, 47, 172, 255), Color.fromARGB(255, 47, 194, 194)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  TextStyle clienteStyle = TextStyle(
    //fontFamily: "FonartoOutline",
    fontFamily: "pirulen",
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  Gradient clienteGradient = LinearGradient(
    colors: const [Color.fromARGB(255, 255, 47, 0), Color.fromARGB(255, 255, 161, 58)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  if (roleName == 'ADMINISTRADOR') {
    return CustomGradientText(
      text: roleName,
      style: adminStyle,
      gradient: adminGradient,
    );
  } else if (roleName == 'CLIENTE') {
    return CustomGradientText(
      text: roleName,
      style: clienteStyle,
      gradient: clienteGradient,
    );
  } else {
    // Por defecto, usa el estilo y gradiente de Admin (o define otros valores predeterminados)
    return CustomGradientText(
      text: roleName,
      style: adminStyle,
      gradient: adminGradient,
    );
  }
}

