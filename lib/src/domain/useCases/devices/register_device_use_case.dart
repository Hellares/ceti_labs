import 'dart:io';

import 'package:ceti_labs/src/domain/models/device.dart';
import 'package:ceti_labs/src/domain/repository/device_repository.dart';

class RegisterDeviceUseCase{
  DeviceRepository deviceRepository;
  RegisterDeviceUseCase(this.deviceRepository);

  run(Device device, File file) => deviceRepository.createDevice(device, file);
}