import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/features/inventory_report_model/inventory_report_bloc.dart';
import '../../../blocs/features/inventory_report_model/inventory_report_event.dart';

class StockHeader extends StatelessWidget {
  final DateTime selectedDate;

  const StockHeader({
    super.key,
    required this.selectedDate,
  });

  Future<void> _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2035),
    );

    if (date != null) {
      context.read<StockReportBloc>().add(
        ChangeStockReportDate(date),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        // Date Container
        Expanded(
          child: InkWell(
            onTap: () => _pickDate(context),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white24,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "Date",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text(
                          DateFormat("dd MMM, yyyy")
                              .format(selectedDate),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // const Icon(
                  //   Icons.calendar_month,
                  //   color: Colors.white,
                  //   size: 20,
                  // ),
                ],
              ),
            ),
          ),
        ),


        const SizedBox(width: 10),


        // Calendar Button
        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 45,
            width: 55,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}