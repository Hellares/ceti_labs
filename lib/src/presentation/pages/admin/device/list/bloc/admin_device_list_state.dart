import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';

class AdminDeviceListState extends Equatable{
  final Resource? response;
  const AdminDeviceListState({this.response});

  AdminDeviceListState copyWith({
    Resource<dynamic>? response,
  }){
    return AdminDeviceListState(response: response ?? this.response);
  }  
  @override
  List<Object?> get props => [response];  

  
}

