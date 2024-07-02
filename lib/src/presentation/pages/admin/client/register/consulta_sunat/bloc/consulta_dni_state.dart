import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';

class ConsultaDniState extends Equatable{  
  final BlocFormItem dni;
  final String? numberDni;
  final String? nombres;
  final String? apellidos;
  final Resource? response;

  const ConsultaDniState({
    this.dni = const BlocFormItem(error: 'error'),//hace la consulta de dni a buscar
    this.numberDni,
    this.nombres,
    this.apellidos,
    this.response
  });

  ConsultaDniState copyWith({
    BlocFormItem? dni,
    String? numberDni,
    String? nombres,
    String? apellidos,
    Resource? response
    }){
    return ConsultaDniState(
      dni: dni ?? this.dni,
      numberDni: numberDni ?? this.numberDni,
      nombres: nombres ?? this.nombres,
      apellidos: apellidos ?? this.apellidos,
      response: response
    );
  }

  @override
  List<Object?> get props => [dni , response];

}