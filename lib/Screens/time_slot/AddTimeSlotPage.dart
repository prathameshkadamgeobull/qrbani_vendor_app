import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

import '../../blocs/features/time_slot/time_slot_bloc.dart';
import '../../blocs/features/time_slot/time_slot_event.dart';
import '../../models/time_slot_model.dart';

class AddTimeSlotPage extends StatefulWidget {
  const AddTimeSlotPage({super.key});

  @override
  State<AddTimeSlotPage> createState() => _AddTimeSlotPageState();
}

class _AddTimeSlotPageState extends State<AddTimeSlotPage> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final TextEditingController capacityController = TextEditingController();


  String getSelectedDate(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  String getHijriDate(DateTime date) {
    HijriCalendar.setLocal("en");

    final hijri = HijriCalendar.fromDate(
      DateTime(date.year, date.month, date.day),
    );

    return "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear}";
  }
  Future<void> selectDate() async {

    DateTime? pickedDate = await showDatePicker(

      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2025),

      lastDate: DateTime(2030),

      builder: (context, child) {

        return Theme(

          data: Theme.of(context).copyWith(

            colorScheme: const ColorScheme.light(

              primary: Color(0xff006B45), // green header

              onPrimary: Colors.white,

              onSurface: Colors.black,

            ),

          ),

          child: child!,

        );

      },

    );


    if (pickedDate != null) {
      debugPrint("Picked Date: $pickedDate");

      setState(() {
        selectedDate = pickedDate;
      });

      debugPrint("Selected Date: $selectedDate");
    }

  }
  Future<void> selectTime(bool isStart) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Add Time Slot",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      GestureDetector(
                        onTap: () {
                          selectDate();
                        },

                        child: Container(
                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),

                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                selectedDate == null
                                    ? "Select Date"
                                    : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),

                              const Icon(
                                Icons.calendar_month,
                              ),

                            ],
                          ),
                        ),
                      ),


                      const SizedBox(height: 25),


                      const Text(
                        "Time Slot",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),


                      const SizedBox(height: 10),


                      Row(
                        children: [

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                selectTime(true);
                              },

                              child: timeBox(
                                startTime == null
                                    ? "Start Time"
                                    : startTime!.format(context),
                              ),
                            ),
                          ),


                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.arrow_forward),
                          ),


                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                selectTime(false);
                              },

                              child: timeBox(
                                endTime == null
                                    ? "End Time"
                                    : endTime!.format(context),
                              ),
                            ),
                          ),

                        ],
                      ),


                      const SizedBox(height: 25),


                      const Text(
                        "Capacity",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),


                      const SizedBox(height: 10),


                      TextField(
                        controller: capacityController,
                        keyboardType: TextInputType.number,
                        cursorColor: const Color(0xff006B45),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(
                          hintText: "Enter capacity",

                          prefixIcon: const Icon(
                            Icons.people,
                            color: Color(0xff006B45),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff006B45),
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff006B45),
                              width: 2,
                            ),
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                    ],
                  ),
                ),
              ),


              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  onPressed: () {

                    if (selectedDate == null ||
                        startTime == null ||
                        endTime == null ||
                        capacityController.text.trim().isEmpty) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all fields"),
                        ),
                      );
                      return;
                    }

                    final capacity = int.tryParse(capacityController.text);

                    if (capacity == null || capacity <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Capacity must be greater than 0"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final slot = TimeSlotModel(
                      date: getSelectedDate(selectedDate!),
                      time: "${startTime!.format(context)} - ${endTime!.format(context)}",
                      capacity: capacity,
                      booked: 20, // test value
                      isFull: false,
                    );

                    Navigator.pop(context, slot);
                  },


                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    const Color(0xff006B45),

                    shape: RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(12),

                    ),

                  ),


                  child: const Text(
                    "Add Time Slot",

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }



  Widget timeBox(String text){

    return Container(

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(

        border:
        Border.all(color:Colors.grey.shade300),

        borderRadius:
        BorderRadius.circular(12),

      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children:[

          Text(
            text,
            style:const TextStyle(
              fontSize:15,
            ),
          ),

          const Icon(Icons.access_time)

        ],

      ),

    );

  }

}