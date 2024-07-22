
import 'package:ceti_labs/src/domain/repository/device_repository.dart';

class AssignComponentToDeviceUseCase{
  DeviceRepository deviceRepository;
  AssignComponentToDeviceUseCase(this.deviceRepository);
  run(String idDevice, String componentName) => deviceRepository.assignComponentToDevice(idDevice, componentName);
}