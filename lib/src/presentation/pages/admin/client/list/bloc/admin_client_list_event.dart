import 'package:equatable/equatable.dart';

abstract class AdminClientListEvent extends Equatable{
  const AdminClientListEvent();

  @override
  List<Object?> get props => [];
}

class GetClients extends AdminClientListEvent{
  const GetClients();

  @override
  List<Object?> get props => [];
}
