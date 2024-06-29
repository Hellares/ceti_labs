import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class ConsultaDniEvent extends Equatable{
  const ConsultaDniEvent();
  @override
  List<Object?> get props => [];
}

class InitEvent extends ConsultaDniEvent{
  const InitEvent();
}

class DniChangedSunat extends ConsultaDniEvent{
  final BlocFormItem numberDni;
  const DniChangedSunat({required this.numberDni});
  @override
  List<Object?> get props => [numberDni];
}

class NombreChanged extends ConsultaDniEvent{
  final String nombre;
  const NombreChanged({required this.nombre});
  @override
  List<Object?> get props => [nombre];
}

class ButtonPressed extends ConsultaDniEvent{
  const ButtonPressed();
  @override
  List<Object?> get props => [];
}