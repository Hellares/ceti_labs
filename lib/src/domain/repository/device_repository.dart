

import 'dart:io';

import 'package:ceti_labs/src/domain/models/component_device_response.dart';
import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

abstract class DeviceRepository{
  Future<Resource<List<Device>>> getDevices();
  Future<Resource<ComponentDeviceResponse>> getComponentDevice(String compo);
  Future<Resource<ComponentDeviceResponse>>assignComponentToDevice(String idDevice, String componentName);
  Future<Resource<Device>> createDevice(Device device, File file);

}