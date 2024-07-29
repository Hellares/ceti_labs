import 'dart:io';

import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http; 

class AdminDeviceListItem extends StatelessWidget {
  final AdminDeviceListBloc? bloc;
  final Device? device;
  final Function(Device device)? onTap;
  const AdminDeviceListItem(this.bloc, this.device, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: GestureDetector(
        onTap: () => onTap!(device!),
        child: ListTile(
          leading: device?.image != null
              ? SizedBox(
                  width: 45,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/no-image.png',
                    image: device!.image!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                )
              : SizedBox(
                width: 45,
                child: Image.asset(
                    'assets/img/no-image.png',
                    fit: BoxFit.cover,
                  ),
              ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                device?.name ?? '',
                style: TextStyle(
                  fontFamily: 'Araboto Normal 400',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color:Color.fromARGB(255, 70, 68, 68)
                ),
              ),
                          
            ],
            
          ),
          trailing: GestureDetector(
            child: Icon(Icons.image_search, color: Colors.blue, size: 25,),
            onTap: (){
              _showImageDialog(context, device!);
            },
          ),
        ),
        
      ),
    );

  
  }

  void _showImageDialog(BuildContext context, Device device) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin: EdgeInsets.all(20),
                    minScale: 0.5,
                    maxScale: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(device.image!)
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cerrar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await _saveImage(device.image!);
                        },
                        child: Text('Descargar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _saveImage(String imageUrl) async {
    try {
      // Descarga la imagen
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;

        // Guarda la imagen en el directorio temporal
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_image.png');
        await file.writeAsBytes(bytes);

        // Guarda la imagen en la galería
        final result = await ImageGallerySaver.saveFile(file.path);
        if (result['isSuccess']) {
          Fluttertoast.showToast(msg: 'Imagen guardada en la galería');
        } else {
          Fluttertoast.showToast(msg: 'Error al guardar la imagen');
        }
      } else {
        Fluttertoast.showToast(msg: 'Error al descargar la imagen');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e');
    }
  }
}


