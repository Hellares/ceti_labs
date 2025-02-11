import 'package:ceti_labs/src/domain/models/user.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/bloc/register_support_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/bloc/register_support_state.dart';
import 'package:ceti_labs/src/widgets/bs_device.dart';
import 'package:ceti_labs/src/widgets/bs_select_tech.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv4.dart';
import 'package:ceti_labs/src/widgets/custom_textfeld_multiline.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv4.dart';
import 'package:ceti_labs/src/widgets/expandable_component_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminRegisterSupportContent extends StatelessWidget {
  final RegisterSupportBloc? bloc;
  final RegisterSupportState state;
  final User? user;

  const AdminRegisterSupportContent(this.bloc, this.state, this.user, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: state.formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text('DATOS DE CLIENTE', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),),
              ),
              if (user != null) _cardInfoUser(user!),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text('DATOS DE DISPOSITIVO', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),),
              ),
              _cardRegisterDevice(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text('DETALLES DE DISPOSITIVO', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),),
              ),
              ExpandableComponentCard(),
              //SizedBox(height: 2),
              _cardRegisterDescriptionDeviceError(),
              //SizedBox(height: 7),
              _cardRecommendation(),
              SizedBox(height: 10),
              _cardAccessories(),
              SizedBox(height: 10),
              _cardImages(context),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text('ASIGNAR TECNICO', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),),
              ),
              _cardAssignTech(),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text('PRECIO APROX.', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),),
              ),
              _cardPrice(),
              SizedBox(height: 15),
              CustomButtonV4(
                text: '|--- REGISTRAR ---|',
                colortext: const Color.fromARGB(255, 12, 89, 151),
                onPressed: () {},
                color1: Colors.white,
                color2: Colors.white,
                borderGradientColors:const [Color.fromARGB(255, 252, 17, 17), Colors.black],
                
              ),
              SizedBox(height: 25),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardInfoUser(User user) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 1),//! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow('assets/icons/user1.svg', user.name),
          _buildInfoRow('assets/icons/dni.svg', user.dni.toString()),
          _buildInfoRow('assets/icons/phone.svg', user.phone, isLast: false),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text, {bool isLast = false}) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 45,
              child: SvgPicture.asset(
                iconPath,
                width: 22,
                height: 22,
              ),
            ),
            Expanded(
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 12, color: const Color.fromARGB(221, 61, 61, 61),fontFamily: 'Araboto Normal 400',fontWeight: FontWeight.w600),
                  ),
                  if (!isLast)
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Divider(height: 1, color: Colors.grey[300]),
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: isLast ? 0 : 10),
      ],
    );
  }

  Widget _cardRegisterDevice() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0), //! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(          
          children: [
            //BSDeviceSharedPreference(),
            BSDevice(),
            
            SizedBox(height: 12),
            CustomTextFieldV4(
              label: 'Marca',
              sizeFont: 12,
              colorLabel: Colors.grey[600],
              onChanged: (txt) {},
            ),
            SizedBox(height: 12),
            CustomTextFieldV4(
              label: 'Serie',
              sizeFont: 12,
              colorLabel: Colors.grey[600],
              onChanged: (txt) {},
            ),
            // SizedBox(height: 12),
            // ExpandableComponentCard()
          ],
        ),
      ),
    );
  }

  Widget _cardRegisterDescriptionDeviceError() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(12),
        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12), ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0),//! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(          
          children: [
            Container(
              margin: EdgeInsets.only(left: 7,bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text('DIAGNOSTICO GENERAL', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),)),
            CustomTextFieldMultiline(
              label: 'Diagnostico',
              //height: 40,
              svgIconPath: "assets/icons/diagnostico.svg",
              sizeIcon: 28,
              maxLines: 3,
              sizeFont: 12,
              //colorFont: Color.fromARGB(255, 238, 144, 20),
              colorLabel: const Color.fromARGB(255, 117, 117, 117),
              onChanged: (txt) {},
            ),            
          ],
        ),
      ),
    );
  }

  Widget _cardRecommendation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(12),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0),//! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(          
          children: [
            Container(
              margin: EdgeInsets.only(left: 7,bottom: 5,top: 10),
              alignment: Alignment.centerLeft,
              child: Text('RECOMENDACIONES', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),)),
            CustomTextFieldMultiline(
              label: 'Diagnostico',
              //height: 40,
              svgIconPath: "assets/icons/engranes.svg",
              sizeIcon: 30,
              maxLines: 3,
              sizeFont: 12,
              colorFont: Color.fromARGB(255, 45, 143, 235),
              colorLabel: Colors.grey[600],
              onChanged: (txt) {},
            ),            
          ],
        ),
      ),
    );
  }

  Widget _cardAccessories() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0),//! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(          
          children: [
            Container(
              margin: EdgeInsets.only(left: 7,bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text('ACCESORIOS', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),)),
            CustomTextFieldMultiline(
              label: 'Accesorios',
              //height: 40,
              svgIconPath: "assets/icons/accesorios2.svg",
              maxLines: 3,
              sizeFont: 12,
              colorFont: Color.fromARGB(255, 45, 143, 235),
              colorLabel: Colors.grey[600],
              onChanged: (txt) {},
            ),            
          ],
        ),
      ),
    );
  }

  Widget _cardImages(BuildContext context) {
    
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0),//! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      
      child: Column(
        children: [
          
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 22),
            child: Text('IMAGENES', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 138, 138, 138), fontWeight: FontWeight.w600, fontFamily: 'Araboto Regular 400'),)),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _imageProductOne(context),
              //SizedBox(width: 10),
              _imageProductTwo(context),
              //SizedBox(width: 10),
              _imageProductThree(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageProductOne(BuildContext context){
    return GestureDetector(
      // onTap: (){
      //   selectOptionImageDialog(
      //     context, 
      //     () { bloc?.add(PickImage(numberFile: 2)); }, 
      //     () { bloc?.add(TakePhoto(numberFile: 2)); }
      //   );
      // },
      child: SizedBox(    
        width: 100,        
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: state.file2 != null
            ? Image.file(
              state.file2!,
              fit: BoxFit.cover,
            )
            : Image.asset('assets/img/no-image.png', fit: BoxFit.cover,)
          )
        ),
      ),
    );
  }

  Widget _imageProductTwo(BuildContext context){
    return GestureDetector(
      // onTap: (){
      //   selectOptionImageDialog(
      //     context, 
      //     () { bloc?.add(PickImage(numberFile: 2)); }, 
      //     () { bloc?.add(TakePhoto(numberFile: 2)); }
      //   );
      // },
      child: SizedBox(        
        width: 100,        
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: state.file2 != null
            ? Image.file(
              state.file2!,
              fit: BoxFit.cover,
            )
            : Image.asset('assets/img/no-image.png', fit: BoxFit.cover,)
          )
        ),
      ),
    );
  }

  Widget _imageProductThree(BuildContext context){
    return GestureDetector(
      // onTap: (){
      //   selectOptionImageDialog(
      //     context, 
      //     () { bloc?.add(PickImage(numberFile: 2)); }, 
      //     () { bloc?.add(TakePhoto(numberFile: 2)); }
      //   );
      // },
      child: SizedBox(      
        width: 100,        
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: state.file2 != null
            ? Image.file(
              state.file2!,
              fit: BoxFit.cover,
            )
            : Image.asset('assets/img/no-image.png', fit: BoxFit.cover,)
          )
        ),
      ),
    );
  }
  
  Widget _cardAssignTech() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0), //! Cambiar el offset del sombreado efecto flotante
          ),
        ],        
      ),      
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: Column(                    
          children: const [
            BSSelectTech(),            
          ],
        ),
      ),      
    );
  }

  Widget _cardPrice() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 0), //! Cambiar el offset del sombreado efecto flotante
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: Column(
          children: [
              //SizedBox(height: 5),
            CustomTextFieldMultiline(
              // label: 'Precio',
              maxLines: 1,
              sizeFont: 12,
              colorLabel: Colors.grey[600],
              onChanged: (txt) {},
              hintText: '0.00',
              keyboardType: TextInputType.number,
            ),            
          ],
        ),
      ),
    );
  }
}


