import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/time_slot_model.dart';
import '../AddTimeSlotPage.dart';
import '../../../blocs/features/time_slot/time_slot_bloc.dart';
import '../../../blocs/features/time_slot/time_slot_event.dart';


class AddTimeSlotButton extends StatelessWidget {

  const AddTimeSlotButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton.extended(

      backgroundColor: const Color(0xff006B45),

      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),

      label: const Text(
        "Add Time Slot",
        style: TextStyle(
          color: Colors.white,
        ),
      ),


      onPressed: () async {


        final result = await Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) =>
            const AddTimeSlotPage(),

          ),

        );


        if(result != null && result is TimeSlotModel){

          context.read<TimeSlotBloc>().add(

            AddTimeSlot(
              slot: result,
            ),

          );

        }


      },

    );

  }
}