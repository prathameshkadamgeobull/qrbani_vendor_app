import 'package:flutter/material.dart';
import 'package:qrbani_vender_app/Screens/notifications/notifications_screen.dart';

class DashboardHeader extends StatelessWidget {
  final String vendorName;

  const DashboardHeader({
    super.key,
    required this.vendorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0A6A3C),
            Color(0xff08552F),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Drawer Button
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.12),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 18),

              /// Greeting
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Assalamu Alaikum,",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),

                    const SizedBox(height: 2),

                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            vendorName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        // const Icon(
                        //   Icons.keyboard_arrow_down,
                        //   color: Colors.white,
                        //   size: 28,
                        // )
                      ],
                    )
                  ],
                ),
              ),

              /// Notification
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                   // color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notification_add_outlined,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}