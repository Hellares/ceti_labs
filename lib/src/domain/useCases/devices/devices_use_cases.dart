import 'package:ceti_labs/src/domain/useCases/devices/assign_component_todevice_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/devices/get_components_bydevice_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/devices/get_device_use_case.dart';
import 'package:ceti_labs/src/domain/useCases/devices/register_device_use_case.dart';

class DevicesUseCases{
  GetDeviceUseCase getDevices;
  GetComponentByDeviceUseCase getComponentByDevice;
  AssignComponentToDeviceUseCase assignComponentToDevice;
  RegisterDeviceUseCase registerDevice;
  DevicesUseCases({
    required this.getDevices,
    required this.getComponentByDevice,
    required this.assignComponentToDevice,
    required this.registerDevice
  });
}