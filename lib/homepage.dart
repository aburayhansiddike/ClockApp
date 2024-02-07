// ignore_for_file: library_private_types_in_public_api

import 'package:clock_app/bottom_nav_bar.dart';
import 'package:clock_app/digital_clock.dart';
import 'package:clock_app/stop_watch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:clock_app/timer_clock.dart';
import 'package:clock_app/analog_clock.dart';



class HomePage extends StatefulWidget{
  const HomePage({super.key});

	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	@override
	Widget build(BuildContext context){
    
		return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
			body: DigitalClockPage(),
		);
	}
}