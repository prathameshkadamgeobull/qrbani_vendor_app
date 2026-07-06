import 'package:equatable/equatable.dart';

abstract class AiForecastEvent extends Equatable {
  const AiForecastEvent();

  @override
  List<Object> get props => [];
}

class LoadAiForecast extends AiForecastEvent {}

class ChangeAnimal extends AiForecastEvent {
  final String animal;

  const ChangeAnimal(this.animal);

  @override
  List<Object> get props => [animal];
}