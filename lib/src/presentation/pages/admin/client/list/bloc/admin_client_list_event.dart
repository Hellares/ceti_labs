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

class SearchClients extends AdminClientListEvent{
  final String dni;
  //final String name;
  const SearchClients({required this.dni});
  @override
  List<Object?> get props => [dni];
}
