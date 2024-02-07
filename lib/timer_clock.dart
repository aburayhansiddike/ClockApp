import 'package:clock_app/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  TextEditingController _hoursController = TextEditingController();
  TextEditingController _minutesController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();
  int _totalSeconds = 0;
  bool _isRunning = false;
  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Hours'),
            ),
            TextField(
              controller: _minutesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Minutes'),
            ),
            TextField(
              controller: _secondsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Seconds'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text(_isRunning ? 'Reset' : 'Start Timer'),
            ),
            ElevatedButton(
              onPressed: _isRunning ? _pauseTimer : null,
              child: Text(_isPaused ? 'Resume' : 'Pause', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
              if (_isRunning && !_isPaused && _totalSeconds > 0) {
                _totalSeconds--;
              }
              if(_isRunning && _totalSeconds == 0){
                final playerAudio = AudioPlayer();
                playerAudio.play(AssetSource('naughty_vivo.mp3'));
                _isRunning = false;
              }
              return Text(
                'Time Remaining: $_formatDuration',
                style: TextStyle(fontSize: 18),
              );
            }),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }

  String get _formatDuration {
    final Duration duration = Duration(seconds: _totalSeconds);
    return '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
        _totalSeconds = 0;
      });
      return;
    }
    int hours = int.tryParse(_hoursController.text) ?? 0;
    int minutes = int.tryParse(_minutesController.text) ?? 0;
    int seconds = int.tryParse(_secondsController.text) ?? 0;

    _totalSeconds = hours * 3600 + minutes * 60 + seconds;
    setState(() {
      _isRunning = true;
      _isPaused = false;
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }
}