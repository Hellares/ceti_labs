
import 'package:ceti_labs/src/domain/repository/device_repository.dart';

class GetDeviceUseCase{
  DeviceRepository deviceRepository;
  GetDeviceUseCase(this.deviceRepository);
  run() => deviceRepository.getDevices();

}