import 'package:clock_app/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class AnalogClockPage extends StatefulWidget{
  const AnalogClockPage({super.key});

  @override
  State<AnalogClockPage> createState() => _MyAnalogClockPageState();
}

class _MyAnalogClockPageState extends State<AnalogClockPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock"),
      ),
      body: const Center(
        child: AnalogClock(
          decoration: BoxDecoration(
            //border: Border.all(width: 2.0, color: Colors.black),
            color: Colors.transparent,
            shape: BoxShape.circle),
          showDigitalClock: false,
          width: 310.0,
          isLive: true,
        ),
      ),

      bottomNavigationBar: BottomNavBar(index: 0),
    );
    throw UnimplementedError();
  }

}