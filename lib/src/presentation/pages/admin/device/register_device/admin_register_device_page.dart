import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/admin_register_device_content.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/register_device/bloc/admin_register_device_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminRegisterDevicePage extends StatefulWidget {
  const AdminRegisterDevicePage({super.key});

  @override
  State<AdminRegisterDevicePage> createState() => _AdminRegisterDevicePageState();
}

class _AdminRegisterDevicePageState extends State<AdminRegisterDevicePage> {
  AdminRegisterDeviceBloc? _bloc;
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminRegisterDeviceBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Dispositivo'),
      ),
      body: BlocListener<AdminRegisterDeviceBloc, AdminRegisterDeviceState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            context.read<AdminDeviceListBloc>().add(GetDevices());
            _bloc?.add(ResetForm());
            Fluttertoast.showToast(msg: 'La categoria se creo correctamente', toastLength: Toast.LENGTH_LONG);            
          } else if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        }, 
        child: BlocBuilder<AdminRegisterDeviceBloc, AdminRegisterDeviceState>(
          builder: (context, state) {
            return AdminRegisterDeviceContent(_bloc, state);
          },
        )
      ),
    );
  }
}