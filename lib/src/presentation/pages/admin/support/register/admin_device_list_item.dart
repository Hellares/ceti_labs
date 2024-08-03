import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_bloc.dart';
import 'package:flutter/material.dart';

class AdminDeviceListItem extends StatelessWidget {
  final AdminDeviceListBloc? bloc;
  final Device? device;
  const AdminDeviceListItem(this.bloc, this.device, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListTile(          
        title: Text(device?.name ?? ''),          
      ),
    );  
  }
}


