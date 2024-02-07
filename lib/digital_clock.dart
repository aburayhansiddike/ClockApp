import 'package:clock_app/bottom_nav_bar.dart';
import'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class DigitalClockPage extends StatefulWidget{
  const DigitalClockPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyDigitalClockPage();

}

class _MyDigitalClockPage extends State<DigitalClockPage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title:const Text('Digital Clock')
      ),
      body:  Center(
        child: DigitalClock(
          digitAnimationStyle: Curves.fastEaseInToSlowEaseOut,
          is24HourTimeFormat: false,
          areaDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          hourMinuteDigitTextStyle: const TextStyle(color: Colors.black54, fontSize: 100),
          secondDigitTextStyle: const TextStyle(color: Colors.black45, fontSize: 50),
          amPmDigitTextStyle: const TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: BottomNavBar(index: 1),
    );
  }

}