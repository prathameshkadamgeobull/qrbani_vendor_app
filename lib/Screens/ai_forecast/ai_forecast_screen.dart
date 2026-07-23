import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/ai_forecast/ai_forecast_bloc.dart';
import '../../blocs/features/ai_forecast/ai_forecast_event.dart';
import '../../blocs/features/ai_forecast/ai_forecast_state.dart';

import 'widgets/demand_dropdown.dart';
import 'widgets/forecast_chart.dart';
import 'widgets/legend_widget.dart';
import 'widgets/recommendation_card.dart';

class AiForecastScreen extends StatefulWidget {
  const AiForecastScreen({super.key});

  @override
  State<AiForecastScreen> createState() => _AiForecastScreenState();
}

class _AiForecastScreenState extends State<AiForecastScreen> {

  @override
  void initState() {
    super.initState();

    context.read<AiForecastBloc>().add(
      LoadAiForecast(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF7F7F7),

      appBar: AppBar(
        title: const Text("AI Demand Forecast"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: BlocBuilder<AiForecastBloc, AiForecastState>(
        builder: (context, state) {

          if (state is AiForecastLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AiForecastLoaded) {

            final forecast = state.forecast;

          return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                 // const SizedBox(height: 130),

                  DemandDropdown(
                    selectedAnimal: forecast.animal,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    forecast.demand,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    forecast.period,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ForecastChart(
                    low: forecast.low,
                    medium: forecast.medium,
                    high: forecast.high,
                  ),

                  const SizedBox(height: 20),

                  const LegendWidget(),

                  const SizedBox(height: 20),

                  RecommendationCard(
                    recommendation: forecast.recommendation,
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}