import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

class ConsultaDniState extends Equatable{  
  final BlocFormItem dni;
  final String? nombres;
  final Resource? response;

  const ConsultaDniState({
    this.dni = const BlocFormItem(error: 'error'),
    this.nombres ,
    this.response
  });

  ConsultaDniState copyWith({
    BlocFormItem? dni,
    String? nombres,
    Resource? response
    }){
    return ConsultaDniState(
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      response: response
    );
  }

  @override
  List<Object?> get props => [dni, nombres, response];

}