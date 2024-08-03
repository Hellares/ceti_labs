import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/admin_device_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BSDevice extends StatefulWidget {
  const BSDevice({super.key});

  @override
  State<BSDevice> createState() => _BSDeviceState();
}

class _BSDeviceState extends State<BSDevice> {
  late AdminDeviceListBloc? bloc;
  String selectedDeviceName = 'Seleccionar dispositivo';


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: [
            Icon(
              Icons.category_outlined,
              size: 25.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                //height: 45,
                decoration: BoxDecoration(
                    
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                  child: Text(
                    selectedDeviceName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Araboto Normal 400',
                      color: Colors.teal
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _showDeviceBottomSheet(context);
      },
    );
  }

  void _showDeviceBottomSheet(BuildContext context,) {
    bloc = BlocProvider.of<AdminDeviceListBloc>(context);
    bloc?.add(GetDevices());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<AdminDeviceListBloc, AdminDeviceListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (responseState is Success) {
              final devices = responseState.data as List<Device>;
              return Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Expanded(
                        child: responseState.data.isEmpty
                            ? Center(
                                child: Text('No hay dispositivos disponibles.'))
                            : ListView.builder(
                                itemCount: devices.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedDeviceName = devices[index].name;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: AdminDeviceListItem(
                                      bloc, devices[index]),                                    
                                  );
                                },
                              ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ));
            } else if (responseState is Error) {
              return Center(child: Text('Error: ${responseState.message}'));
            } else {
              return Center(child: Text('No hay dispositivos disponibles.'));
            }
          },
        );
      },
    );
  }


}
