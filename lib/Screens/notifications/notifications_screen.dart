import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/notifications/notification_bloc.dart';
import '../../blocs/features/notifications/notification_event.dart';
import '../../blocs/features/notifications/notification_state.dart';
import '../dashboard/dashboard_screen.dart';
import 'widgets/mark_all_button.dart';
import 'widgets/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  void initState() {
    super.initState();

    context.read<NotificationBloc>().add(
      LoadNotifications(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const DashboardScreen(),
              ),
            );

          },
        ),

        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: BlocBuilder<
            NotificationBloc,
            NotificationState>(
          builder: (context, state) {

            if (state is NotificationLoaded) {

              return Column(
                children: [

                  Expanded(
                    child: ListView.builder(
                      itemCount:
                      state.notifications.length,

                      itemBuilder: (context, index) {

                        final notification =
                        state.notifications[index];

                        return NotificationItem(
                          title: notification.title,
                          subtitle: notification.subtitle,
                          time: notification.time,
                          icon: notification.icon,
                          isRead: notification.isRead,
                          onTap: () {
                            context.read<NotificationBloc>().add(
                              MarkNotificationRead(index),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  MarkAllButton(
                    onPressed: () {
                      context.read<NotificationBloc>().add(
                        MarkAllRead(),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );

          },
        ),
      ),
    );
  }
}