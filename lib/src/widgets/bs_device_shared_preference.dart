import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_bloc.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/device/list/bloc/admin_device_list_state.dart';
import 'package:ceti_labs/src/presentation/pages/admin/support/register/admin_device_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class BSDeviceSharedPreference extends StatefulWidget {
  const BSDeviceSharedPreference({super.key});

  @override
  State<BSDeviceSharedPreference> createState() => _BSDeviceSharedPreferenceState();
}

class _BSDeviceSharedPreferenceState extends State<BSDeviceSharedPreference> {
  late AdminDeviceListBloc bloc;
  String selectedDeviceName = 'Seleccionar dispositivo';
  List<Device> cachedDevices = [];

  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AdminDeviceListBloc>(context);
    _loadCachedDevices();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoadingMore) {
      _fetchMoreDevices();
    }
  }


  Future<void> _loadCachedDevices() async {
    final prefs = await SharedPreferences.getInstance();
    final String? devicesJson = prefs.getString('cached_devices');
    if (devicesJson != null) {
      setState(() {
        cachedDevices = (jsonDecode(devicesJson) as List)
            .map((item) => Device.fromJson(item))
            .toList();
      });
    }
  }

  Future<void> _cacheDevices(List<Device> devices) async {
    final prefs = await SharedPreferences.getInstance();
    final String devicesJson = jsonEncode(devices.map((e) => e.toJson()).toList());
    await prefs.setString('cached_devices', devicesJson);
  }

  void _fetchMoreDevices() {
    setState(() {
      isLoadingMore = true;
    });
    bloc.add(GetDevices());
  }

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
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                  child: Text(selectedDeviceName),
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

  void _showDeviceBottomSheet(BuildContext context) {

    if (cachedDevices.isNotEmpty) {
      _showDeviceList(cachedDevices);
    } else {
      _fetchAndShowDevices();
    }
  }

  void _fetchAndShowDevices() {
    //bloc = BlocProvider.of<AdminDeviceListBloc>(context);
    bloc.add(GetDevices());
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
              _cacheDevices(devices); // Cache the new devices
              return _buildDeviceList(devices);
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

  void _showDeviceList(List<Device> devices) {
    
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildDeviceList(devices);
      },
    );
  }

  Widget _buildDeviceList(List<Device> devices) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: devices.isEmpty
                ? Center(child: Text('No hay dispositivos disponibles.'))
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: devices.length + (isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == devices.length) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedDeviceName = devices[index].name;
                          });
                          Navigator.pop(context);
                        },
                        child: AdminDeviceListItem(bloc, devices[index]),
                      );
                    },
                  ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}