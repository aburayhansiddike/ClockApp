import 'package:clock_app/analog_clock.dart';
import 'package:clock_app/digital_clock.dart';
import 'package:clock_app/stop_watch.dart';
import 'package:clock_app/timer_clock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      selectedIndex: index,
      tabActiveBorder: Border.all(color: Colors.black, width: 1),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      tabs: [
        GButton(
          icon: Icons.access_time,
          text: 'Analog Watch',
          onPressed: () => Get.to(() => AnalogClockPage()),
        ),
        GButton(
          icon: Icons.punch_clock_sharp,
          text: 'Digital Watch',
          onPressed: () => Get.to(() => DigitalClockPage()),
        ),
        GButton(
          icon: Icons.timer,
          text: 'Timer',
          onPressed: () => Get.to(() => TimerScreen()),
        ),
        GButton(
          icon: Icons.av_timer_sharp,
          text: 'Stop Watch',
          onPressed: () => Get.to(() => StopWatch()),
        ),
      ],
    );
  }
}
