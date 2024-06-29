
import 'package:ceti_labs/src/domain/models/sunat_response.dart';
import 'package:ceti_labs/src/domain/useCases/sunat/sunat_use_cases.dart';
import 'package:ceti_labs/src/domain/utils/resource.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_event.dart';
import 'package:ceti_labs/src/presentation/pages/admin/client/register/consulta_sunat/bloc/consulta_dni_state.dart';
import 'package:ceti_labs/src/presentation/utils/bloc_form_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultaDniBloc extends Bloc<ConsultaDniEvent, ConsultaDniState>{
  SunatUseCases sunatUseCases;

  ConsultaDniBloc(this.sunatUseCases):super(ConsultaDniState()){

    on<DniChangedSunat>(_onDniChanged);
    // on<NombreChanged>(_onNombreChanged);
    on<ButtonPressed>(_onButtonPressed);
  }



  // Future<void> _onNombreChanged(NombreChanged event, Emitter<ConsultaDniState> emit) async {
  //   emit(
  //     state.copyWith(
  //       nombres: event.nombre,
  //     )
  //   );
  // }

  Future<void>_onDniChanged(DniChangedSunat event, Emitter<ConsultaDniState> emit) async {
    emit(
      state.copyWith(
        dni: BlocFormItem(
          value: event.numberDni.value,
          error: event.numberDni.value.isNotEmpty ? null : 'Ingresa el numero de DNI',
        ),
      )
    );
  }



  Future<void> _onButtonPressed(ButtonPressed event, Emitter<ConsultaDniState> emit) async {
    emit(
      state.copyWith(
        response: Loading()
      )
    );

    Resource<SunatResponse> sunatResponse = await sunatUseCases.getDataDni.run(state.dni.value);
    if(sunatResponse is Success<SunatResponse>) {
      print(sunatResponse.data.toJson());
      emit(
        state.copyWith(
          response: sunatResponse
        )
      );
    }else if(sunatResponse is Error){
      emit(
        state.copyWith(
          response: sunatResponse
        )
      );
    }
  }
}