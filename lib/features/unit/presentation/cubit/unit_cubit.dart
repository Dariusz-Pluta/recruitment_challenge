import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit()
      : super(UnitState(false, '°C', 'm/s', 'metric', '', UnitStage.initial));

  void change(bool isInFarenheit) {
    switch (isInFarenheit) {
      case false:
        emit(state.setStateToChanged(false, '°C', 'm/s', 'metric'));
        break;
      case true:
        emit(state.setStateToChanged(true, '°F', 'mil/h', 'imperial'));
        break;
    }
  }
}
