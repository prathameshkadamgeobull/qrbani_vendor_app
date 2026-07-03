import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../blocs/features/time_slot/time_slot_bloc.dart';
import '../../blocs/features/time_slot/time_slot_event.dart';
import '../../blocs/features/time_slot/time_slot_state.dart';

import '../dashboard/dashboard_screen.dart';
import 'widgets/time_slot_card.dart';
import 'widgets/add_time_slot_button.dart';

class TimeSlotScreen extends StatefulWidget {
  const TimeSlotScreen({super.key});

  @override
  State<TimeSlotScreen> createState() => _TimeSlotScreenState();
}

class _TimeSlotScreenState extends State<TimeSlotScreen> {
  @override
  void initState() {
    super.initState();

    context.read<TimeSlotBloc>().add(
      const LoadTimeSlots(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,

      floatingActionButton: const AddTimeSlotButton(),

      body: SafeArea(
        child: BlocBuilder<TimeSlotBloc, TimeSlotState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [

                /// Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    18,
                    16,
                    10,
                  ),
                  child: Row(
                    children: [

                      InkWell(
                        onTap: () {
                          context.read<BottomNavBloc>().add(
                            ChangeTabEvent(0),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DashboardScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            "Time Slot Management",
                            style: AppTextStyles.orderTitle,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "10 Dhul-Hijjah 1446",
                  style: AppTextStyles.bodySemiBold,
                ),

                const SizedBox(height: 18),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      8,
                      0,
                      8,
                      90,
                    ),
                    itemCount: state.timeSlots.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 0,
                        ),
                        child: TimeSlotCard(
                          slot: state.timeSlots[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}