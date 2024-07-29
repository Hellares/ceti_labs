import 'dart:io';

import 'package:ceti_labs/src/data/dataSource/remote/service/support_service.dart';
import 'package:ceti_labs/src/domain/models/support.dart';
import 'package:ceti_labs/src/domain/repository/support_repository.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

class SupportRepositoryImpl implements SupportRepository{
  SupportService supportService;
  SupportRepositoryImpl(this.supportService);
  @override
  Future<Resource<Support>> register(Support support, List<File> files) {
    return supportService.register(support, files);
  }
  
}