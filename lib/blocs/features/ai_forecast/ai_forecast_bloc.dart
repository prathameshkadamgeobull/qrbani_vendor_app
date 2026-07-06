import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/ai_forecast_model.dart';
import 'ai_forecast_event.dart';
import 'ai_forecast_state.dart';

class AiForecastBloc
    extends Bloc<AiForecastEvent, AiForecastState> {

  AiForecastBloc() : super(AiForecastInitial()) {

    on<LoadAiForecast>(_loadForecast);

    on<ChangeAnimal>(_changeAnimal);
  }

  void _loadForecast(
      LoadAiForecast event,
      Emitter<AiForecastState> emit,
      ) {
    emit(AiForecastLoading());

    final values = [3.0, 4.0, 5.0, 4.0, 7.0, 8.0, 6.0];

    emit(
      AiForecastLoaded(
        AiForecastModel(
          animal: "Goat",
          demand: "High Demand Expected",
          period: "10 - 12 Dhu'l-Hijjah",
          values: values,
          low: values.map((e) => e * 0.5).toList(),
          medium: values.map((e) => e * 0.3).toList(),
          high: values.map((e) => e * 0.2).toList(),
          recommendation:
          "Stock up recommended: +36% more than current inventory",
        ),
      ),
    );
  }

  void _changeAnimal(
      ChangeAnimal event,
      Emitter<AiForecastState> emit,
      ) {
    List<double> chart;

    if (event.animal == "Goat") {
      chart = [3, 4, 5, 4, 7, 8, 6];
    } else if (event.animal == "Sheep") {
      chart = [2, 3, 3, 4, 5, 6, 5];
    } else {
      chart = [2, 2, 4, 3, 5, 5, 4];
    }

    emit(
      AiForecastLoaded(
        AiForecastModel(
          animal: event.animal,
          demand: "High Demand Expected",
          period: "10 - 12 Dhu'l-Hijjah",
          values: chart,

          // ✅ ADD THESE 3 (THIS IS WHAT YOU MISSED)
          low: chart.map((e) => e * 0.5).toList(),
          medium: chart.map((e) => e * 0.3).toList(),
          high: chart.map((e) => e * 0.2).toList(),

          recommendation:
          "Stock up recommended: +36% more than current inventory",
        ),
      ),
    );
  }
}