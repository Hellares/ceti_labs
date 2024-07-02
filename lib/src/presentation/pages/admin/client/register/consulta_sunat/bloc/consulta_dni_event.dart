import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

abstract class ConsultaDniEvent extends Equatable{
  const ConsultaDniEvent();
  @override
  List<Object?> get props => [];
}

class DniChangedSunat extends ConsultaDniEvent{
  final BlocFormItem numberDni;
  const DniChangedSunat({required this.numberDni});
  @override
  List<Object?> get props => [numberDni];
}

class ResetSunatForm extends ConsultaDniEvent{
  const ResetSunatForm();
  @override
  List<Object?> get props => [];
}

class ButtonPressed extends ConsultaDniEvent{
  const ButtonPressed();
  @override
  List<Object?> get props => [];
}