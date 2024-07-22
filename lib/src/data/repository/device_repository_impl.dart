import 'dart:io';

import 'package:ceti_labs/src/data/dataSource/remote/service/device_service.dart';
import 'package:ceti_labs/src/domain/models/component_device_response.dart';
import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/repository/device_repository.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

class DeviceRepositoryImpl extends DeviceRepository{
  DeviceService deviceService;
  DeviceRepositoryImpl(this.deviceService);
  
  @override
  Future<Resource<List<Device>>> getDevices() {
    return deviceService.getDevices();
  }

  @override
  Future<Resource<ComponentDeviceResponse>> getComponentDevice(String compo) {
    return deviceService.getComponentDevice(compo);
  }
  
  @override
  Future<Resource<ComponentDeviceResponse>> assignComponentToDevice(String idDevice, String componentName) {
    return deviceService.assignComponentToDevice(idDevice, componentName);
  }

  @override
  Future<Resource<Device>> createDevice(Device device, File file) async {
    return deviceService.createDevice(device, file);
  }
}