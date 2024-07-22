import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:equatable/equatable.dart';


class AdminComponentState  extends Equatable{
  final Resource? response;
  const AdminComponentState({

    this.response
  });

  AdminComponentState copyWith({
    Resource? response,
  }){
    return AdminComponentState(
      response: response ?? this.response
    );
  }  
  @override
  List<Object?> get props => [response];
}