import 'dart:core';
import 'dart:async';
import 'package:clock_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({Key? key});

	@override
	Widget build(BuildContext context) {
		return GetMaterialApp(
			title: 'Alarm Clock',
			theme: ThemeData(
				primarySwatch: Colors.deepPurple,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: const HomePage(),
			debugShowCheckedModeBanner: false,
		);
	}
}