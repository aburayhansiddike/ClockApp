import 'dart:math';

import 'package:clock_app/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;

  void stop(){
      timer!.cancel();
      setState(() {
        started = false;
      });
  }

  void reset(){
      timer!.cancel();
      setState(() {
        seconds = 0;
        minutes = 0;
        hours = 0;

        digitSeconds = "00";
        digitMinutes = "00";
        digitHours = "00";

        setState(() {
          started = false;
        });
      });
  }

  void start(){
    setState(() {
      started = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) { 
      int localSeconds = seconds + 1;
      int localMintues = minutes;
      int localHours = hours;
      if(localSeconds > 59){
        if(localMintues > 59){
          localHours++;
          localMintues = 0;
        }else{
          localMintues++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMintues;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? "$seconds":"0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes":"0$minutes";
        digitHours = (hours >= 10) ? "$hours":"0$hours";
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                if (started) {
                  stop();
                } else {
                  start();
                }
              },
              padding: EdgeInsets.all(0),
              child: Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4)),
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                reset();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.white60),
              ),
              child:const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
            )
          ],
        )),
      ),

      bottomNavigationBar: BottomNavBar(index: 3),
    );
  }
}
