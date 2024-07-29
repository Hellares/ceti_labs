import 'dart:io';

import 'package:ceti_labs/src/domain/models/support.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';

abstract class SupportRepository {
  Future<Resource<Support>> register(Support support, List<File> files);
}