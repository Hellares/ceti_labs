
import 'package:ceti_labs/src/domain/models/component_device_response.dart';
import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/component/list/admin_component_item.dart';
import 'package:ceti_labs/src/presentation/pages/admin/component/list/bloc/admin_component_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/component/list/bloc/admin_component_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/component/list/bloc/admin_componet_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/admin_device_list_item.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/admin_register_device_page.dart';
import 'package:ceti_labs/src/widgets/custom_buttonv3.dart';
import 'package:ceti_labs/src/widgets/custom_textfieldv3.dart';
import 'package:ceti_labs/src/widgets/page_animation_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminDeviceListPage extends StatefulWidget {
  const AdminDeviceListPage({super.key});

  @override
  State<AdminDeviceListPage> createState() => _AdminDeviceListPageState();
}

class _AdminDeviceListPageState extends State<AdminDeviceListPage> {
  late AdminDeviceListBloc? _bloc;
  late AdminComponentBloc? _componentBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetDevices());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminDeviceListBloc>(context);
    _componentBloc = BlocProvider.of<AdminComponentBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageAnimationRoutes(
              widget: const AdminRegisterDevicePage(),
              ejex: 0.8,
              ejey: 0.8
            )
          );
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: BlocConsumer<AdminDeviceListBloc, AdminDeviceListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool && responseState.data) {
              _bloc?.add(GetDevices());
            }
          } else if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        builder: (context, state) {
          final responseState = state.response;
          if (responseState is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (responseState is Success) {
            List<Device> devices = responseState.data as List<Device>;
            return devices.isEmpty
                ? Center(child: Text('No hay dispositivos disponibles.'))
                : ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      return AdminDeviceListItem(
                        _bloc,
                        devices[index],
                        onTap: (device) =>                          
                            _showComponentesBottomSheet(context, device),                            
                      );
                    },
                  );
          } else if (responseState is Error) {
            return Center(child: Text('Error: ${responseState.message}'));
          } else {
            return Center(child: Text('No hay dispositivos disponibles.'));
          }
        },
      ),
    );
  }

  void _showComponentesBottomSheet(BuildContext context, Device device) {    
    _componentBloc?.add(GetComponentByNameDevice(device.name));
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AdminComponentBloc, AdminComponentState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (responseState is Success) {
              ComponentDeviceResponse response =
                  responseState.data as ComponentDeviceResponse;
              List<Component> componentes = response.components ?? [];
              componentes.sort((a, b) => b.id.compareTo(a.id));
              return Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Expanded(
                      child: componentes.isEmpty
                          ? Center(
                              child: Text('No hay componentes disponibles.'))
                          : AdminComponentItem(
                              deviceName: device.name,
                              componentes: componentes),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonV3(
                          text: 'Agregar Componente',
                          colortext: Color.fromARGB(255, 3, 101, 182),
                          color1: Colors.white,
                          color2: Colors.white,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(14),         
                          borderGradientColors: const[Colors.blue, Color.fromARGB(255, 58, 81, 209), Color.fromARGB(255, 3, 101, 182)],                 
                          onPressed: () {
                            Navigator.pop(context);
                            _showAddComponentBottomSheet(context, device);
                          },                          
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Espacio en la parte inferior
                  ],
                ),
              );
            } else if (responseState is Error) {
              return Center(child: Text('Error: ${responseState.message}'));
            } else {
              return Center(child: Text('cargando...'));
            }
          },
        );
      },
    );
  }

  void _showAddComponentBottomSheet(BuildContext context, Device device) {  
  
  final TextEditingController componentNameController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 40,
          right: 40,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ASIGNAR COMPONENTE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                device.name,
                style: TextStyle(
                  fontFamily: 'Araboto Normal 400',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomTextFieldV3(
              controller: componentNameController,
              label: 'Nombre del componente',
              colorLabel: Colors.blue,
              onChanged: (tex){},
            ),
            SizedBox(height: 16),
            CustomButtonV3(
              text: ' Asignar ',
              colortext: Color.fromARGB(255, 74, 74, 75),
              fontFamily: 'Araboto Normal 400',              
              color1: Colors.white,
              color2: Colors.white,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {                
                String newComponentName = componentNameController.text;
                if (newComponentName.isNotEmpty) {  
                  Navigator.pop(context); // Cierra el ModalBottomSheet
                  _componentBloc?.add(AssignComponentToDevice(device.id.toString(), newComponentName));
                }
              },              //child: Text('Guardar'),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}

}
