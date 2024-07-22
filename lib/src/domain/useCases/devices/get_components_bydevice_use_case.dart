

import 'package:ceti_labs/src/domain/repository/device_repository.dart';

class GetComponentByDeviceUseCase{  
  DeviceRepository componentsdeviceRepository;
  GetComponentByDeviceUseCase(this.componentsdeviceRepository);
  run(String compo) => componentsdeviceRepository.getComponentDevice(compo);

}