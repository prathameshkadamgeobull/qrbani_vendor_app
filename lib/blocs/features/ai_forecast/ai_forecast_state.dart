import 'package:equatable/equatable.dart';
import '../../../models/ai_forecast_model.dart';

abstract class AiForecastState extends Equatable {
  const AiForecastState();

  @override
  List<Object> get props => [];
}

class AiForecastInitial extends AiForecastState {}

class AiForecastLoading extends AiForecastState {}

class AiForecastLoaded extends AiForecastState {
  final AiForecastModel forecast;

  const AiForecastLoaded(this.forecast);

  @override
  List<Object> get props => [forecast];
}

class AiForecastError extends AiForecastState {
  final String message;

  const AiForecastError(this.message);

  @override
  List<Object> get props => [message];
}