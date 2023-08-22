import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poppyflow/constants/kConstants.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(home: BreathWorkSessionPage()));
}

class BreathWorkSessionPage extends StatefulWidget {
  @override
  _BreathWorkSessionPageState createState() => _BreathWorkSessionPageState();
}

class _BreathWorkSessionPageState extends State<BreathWorkSessionPage> {
  Artboard? _riveArtboard;
  RiveAnimationController? _animationController;
  Timer? _timer;
  int _currentPhase = 0;
  final List<BreathPhase> _phases = [
    BreathPhase(name: 'Inhale', duration: 4),
    BreathPhase(name: 'Hold', duration: 4),
    BreathPhase(name: 'Exhale', duration: 4),
  ];

  int _currentDuration = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _timer?.cancel(); // Cancel the timer to avoid setState after dispose
    super.dispose();
  }

  void _loadRiveFile() async {
    final data = await rootBundle.load('assets/videos/breathing_animation.riv');
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;
    setState(() => _riveArtboard = artboard);

    // Initialize the RiveAnimationController
    _animationController = SimpleAnimation('Normal');
    _riveArtboard?.addController(_animationController!);
  }

  void _startBreathWorkSession() {
    if (_riveArtboard != null) {
      if (_isPaused) {
        _animationController?.isActive = !_animationController!.isActive;
        _timer?.cancel();
        _isPaused = false;
        return;
      }

      setState(() {
        _currentPhase = 0;
        _currentDuration = _phases[_currentPhase].duration;
      });

      // Reset the animation to the beginning
      _animationController?.isActive = false;
      _timer?.cancel();
      _isPaused = false;
      _animationController?.isActiveChanged;

      bool countUp = true; // Track the counting direction
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (mounted) {
          if (_currentDuration == 0 || _currentDuration == 4) {
            // Reverse the counting direction when reaching 0 or 4
            countUp = !countUp;
            if (_currentDuration == 4) {
              // Reset the counter to 0 when it reaches 4
              _currentDuration = 0;
            }
            _currentPhase = (_currentPhase + 1) % _phases.length;
          } else {
            if (countUp) {
              _currentDuration++;
            } else {
              _currentDuration--;
            }
          }
        }
      });
    }
  }

  void _stopBreathWorkSession() {
    _timer?.cancel();
    _animationController?.isActive = false;
    _animationController?.isActiveChanged;
    _isPaused = false;
    setState(() {
      _currentDuration = 0;
    });
  }

  void _pauseBreathWorkSession() {
    if (_animationController!.isActive) {
      _timer?.cancel();
      _animationController?.isActive = false;
      _isPaused = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pflowBlueGrey,
      body: Column(
        children: [
          SizedBox(height: 50),
          Text(
            _phases[_currentPhase].name,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(
            child: Center(
              child: _riveArtboard != null
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        RiveAnimation.asset(
                          'assets/videos/breathing_animation.riv',
                          artboard: 'circle animated',
                          controllers: [_animationController!],
                          onInit: (_) => setState(() {}),
                        ),
                        AnimatedNumber(
                          duration: Duration(seconds: 1),
                          value: _currentDuration,
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _startBreathWorkSession,
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _pauseBreathWorkSession,
            child: Icon(Icons.pause),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _stopBreathWorkSession,
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}

class AnimatedNumber extends StatelessWidget {
  final Duration duration;
  final int value;

  AnimatedNumber({required this.duration, required this.value});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween(begin: 0.0, end: value.toDouble()),
      builder: (context, dynamic number, child) {
        return Text(
          number.toInt().toString(),
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

class BreathPhase {
  final String name;
  final int duration;

  BreathPhase({required this.name, required this.duration});
}
