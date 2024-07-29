
import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/list/bloc/admin_client_list_bloc.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv4.dart';
import 'package:ceti_labs/src/widgets/custom_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminClientListItem extends StatelessWidget {
  final AdminClientListBloc? bloc;
  final User? user;
  const AdminClientListItem(this.bloc, this.user,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      elevation: 1,
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 2, left: 15),
        // leading: user != null
        // ? SizedBox(
        //   width: 40,
        //   child: FadeInImage.assetNetwork(
        //     placeholder: 'assets/img/no-image.png', 
        //     image: user!.image!,
        //     fit: BoxFit.cover,
        //     fadeInDuration: Duration(seconds: 1),
        //   ),
        // )
        // : Container(color: Colors.amber,),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${user?.name ?? ''} ${user?.lastname ?? ''}',style: TextStyle(fontFamily: 'Araboto Normal 400', fontWeight: FontWeight.w600, fontSize: 12, color: Color.fromARGB(255, 70, 68, 68)),),
            SizedBox(height: 5,),
            Text(user?.phone ?? '',style: TextStyle(fontFamily: 'Araboto Normal 400',letterSpacing: 1.0,fontWeight: FontWeight.w700, fontSize: 12, color: Color.fromARGB(255, 0, 113, 165)),),
          
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(                  
                  child: CustomButtonV4(
                    onPressed: (){
                      //Navigator.pushNamed(context, 'admin/register/support');
                      Navigator.pushNamed(context, 'admin/register/support', arguments: user);
                    },
                    text: 'Registrar Servicio Tecnico',
                    letterSpacing: 0.5,
                    sizeFont: 12,
                    height: 30,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                    borderWidth: 1,
                    color1: Colors.white,
                    color2: Colors.white,
                    borderGradientColors: const [Color.fromARGB(255, 207, 207, 207), Color.fromARGB(255, 207, 207, 207)],
                    colortext: Color.fromARGB(255, 110, 107, 102),

                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(                  
                  child: CustomButtonIcon(
                    height: 30,
                    onPressed: (){
                      String mensaje = 'Información del cliente:\nNombre: ${user!.name}';
                      launchWhatsApp(user!.phone, mensaje);
                    },
                    svgIcon: "assets/icons/whatsapp.svg",
                    iconSize: 25,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                    borderWidth: 0,
                    color1: Colors.white,
                    color2: Colors.white,
                    borderGradientColors: const [Color.fromARGB(255, 207, 207, 207), Color.fromARGB(255, 207, 207, 207)],
                  ),
                )
              ],
            )
          ],
        ),
        trailing : Wrap(
            //direction: Axis.vertical,
            direction: Axis.horizontal,
            children: [
              
              GestureDetector(
                child: SvgPicture.asset("assets/icons/edit2.svg", height: 23,),
                onTap: (){

                },
              ),
              SizedBox(width: 13,),              
              GestureDetector(
                child: SvgPicture.asset("assets/icons/delete.svg", height: 23,),
                onTap: (){

                },
              ),
              SizedBox(width: 7,),
            ],
            
          ),
      ),
    );
  }

  String generateWhatsAppLink(String phoneNumber, String message) {
  // Eliminar cualquier carácter no numérico del número de teléfono
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  
  // Codificar el mensaje para que sea seguro en una URL
  String encodedMessage = Uri.encodeComponent(message);
  
  // Generar el enlace de WhatsApp
  return 'https://wa.me/$cleanedNumber?text=$encodedMessage';
}

Future<bool> isWhatsAppInstalled() async {
  final Uri whatsappUri = Uri.parse("whatsapp://send");
  return await canLaunchUrl(whatsappUri);
}

Future<void> launchWhatsApp(String phoneNumber, String message) async {
  if (await isWhatsAppInstalled()) {
    String whatsappUrl = generateWhatsAppLink(phoneNumber, message);
    final Uri uri = Uri.parse(whatsappUrl);
    
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      Fluttertoast.showToast(msg: 'No se pudo abrir WhatsApp');
    }
  } else {
    Fluttertoast.showToast(msg: 'WhatsApp no está instalado');
  }
}



}