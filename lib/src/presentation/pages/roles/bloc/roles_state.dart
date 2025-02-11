
import 'package:ceti_labs/src/domain/models/role.dart';
import 'package:equatable/equatable.dart';

class RolesState extends Equatable{
  final List<Role?>? roles;
  const RolesState({
    this.roles
  });

  RolesState copyWith({
    List<Role?>? roles
  }){
    return RolesState(
      roles: roles
    );
  }

  @override
  List<Object?> get props => [roles];

}