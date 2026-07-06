import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/ai_forecast/ai_forecast_bloc.dart';
import '../../../blocs/features/ai_forecast/ai_forecast_event.dart';

class DemandDropdown extends StatelessWidget {
  final String selectedAnimal;

  const DemandDropdown({
    super.key,
    required this.selectedAnimal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedAnimal,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),

          items: const [

            DropdownMenuItem(
              value: "Goat",
              child: Text("Goat"),
            ),

            DropdownMenuItem(
              value: "Sheep",
              child: Text("Sheep"),
            ),

            DropdownMenuItem(
              value: "Camel",
              child: Text("Camel"),
            ),
          ],

          onChanged: (value) {

            if (value != null) {

              context.read<AiForecastBloc>().add(
                ChangeAnimal(value),
              );

            }

          },
        ),
      ),
    );
  }
}