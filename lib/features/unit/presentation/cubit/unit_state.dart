part of 'unit_cubit.dart';

class UnitState extends Equatable {
  final bool isFarenheit;
  final String tempUnit;
  final String windUnit;
  final String unitCall;
  final String errorMessage;
  final UnitStage stage;

  UnitState(
    this.isFarenheit,
    this.tempUnit,
    this.windUnit,
    this.unitCall,
    this.errorMessage,
    this.stage,
  );

  String get getTempUnit => this.tempUnit;
  String get getWindUnit => this.windUnit;
  String get getUnitCall => this.unitCall;
  bool get getIsFarenheitBool => this.isFarenheit;

  bool get initial => stage == UnitStage.initial;

  bool get changed => stage == UnitStage.changed;

  bool get error => stage == UnitStage.error;

  UnitState setStateToChanged(
    bool isInFarenheit,
    String tempUnit,
    String windUnit,
    String unitCall,
  ) =>
      copyWith(
          isFarenheit: isInFarenheit,
          tempUnit: tempUnit,
          windUnit: windUnit,
          unitCall: unitCall,
          stage: UnitStage.changed);

  UnitState setStateToError(String errorMessage) => copyWith(
        errorMessage: errorMessage,
        stage: UnitStage.error,
      );

  @override
  List<Object?> get props =>
      [isFarenheit, tempUnit, windUnit, unitCall, errorMessage, stage];

  UnitState copyWith({
    bool? isFarenheit,
    String? tempUnit,
    String? windUnit,
    String? unitCall,
    UnitStage? stage,
    String? errorMessage,
  }) {
    return UnitState(
      isFarenheit ?? this.isFarenheit,
      tempUnit ?? this.tempUnit,
      windUnit ?? this.windUnit,
      unitCall ?? this.unitCall,
      errorMessage ?? this.errorMessage,
      stage ?? this.stage,
    );
  }
}

enum UnitStage { initial, changed, error }
