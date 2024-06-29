import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';

class AdminClientListState extends Equatable{
  final Resource? response;
  const AdminClientListState({this.response});

  AdminClientListState copyWith({
    Resource<dynamic>? response,
  }){
    return AdminClientListState(response: response ?? this.response);
  }
  
  @override
  List<Object?> get props => [response];
}