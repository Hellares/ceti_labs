
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
    on<ButtonPressed>(_onButtonPressed);
    on<ResetSunatForm>(_onResetSunatForm);
  }

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
      //print(sunatResponse.data.toJson());
      emit(
        state.copyWith(
          numberDni: sunatResponse.data.data.numero,
          nombres: sunatResponse.data.data.nombres,
          apellidos: '${sunatResponse.data.data.apellidoPaterno} ${sunatResponse.data.data.apellidoMaterno}',
          response: sunatResponse
          ),
        
      );

    }else if(sunatResponse is Error){
      emit(
        state.copyWith(
          numberDni: null,
          nombres: null,
          apellidos: null,
          response: sunatResponse
        )
      );
    }
  }

  Future<void> _onResetSunatForm(ResetSunatForm event, Emitter<ConsultaDniState> emit) async {
    emit(
      state.copyWith(
        numberDni: null,
        nombres: null,
        apellidos: null,
        response: null
      )
    );
  }
}