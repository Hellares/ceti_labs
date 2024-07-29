import 'dart:io';

import 'package:ceti_labs/src/domain/models/support.dart';
import 'package:ceti_labs/src/domain/repository/support_repository.dart';

class RegisterSupportUseCase {
  SupportRepository supportRepository;
  RegisterSupportUseCase(this.supportRepository);

  run(Support support, List<File> files) => supportRepository.register(support, files);
}