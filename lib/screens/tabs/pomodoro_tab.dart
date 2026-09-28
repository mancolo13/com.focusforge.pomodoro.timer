import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/storage_service.dart';

class PomodoroTab extends StatefulWidget {
  const PomodoroTab({super.key});

  @override
  State<PomodoroTab> createState() => _PomodoroTabState();
}

class _PomodoroTabState extends State<PomodoroTab> {
  static const int _workTime = 25 * 60;
  static const int _breakTime = 5 * 60;
  int _secondsLeft = _workTime;
  bool _isWorking = true;
  bool _isRunning = false;
  Timer? _timer;

  void _toggle() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      setState(() => _isRunning = true);
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (_secondsLeft > 1) {
          setState(() => _secondsLeft--);
        } else {
          if (_isWorking) {
            final c = StorageService.getInt('focus_sessions') + 1;
            StorageService.setInt('focus_sessions', c);
            setState(() {
              _isWorking = false;
              _secondsLeft = _breakTime;
            });
          } else {
            setState(() {
              _isWorking = true;
              _secondsLeft = _workTime;
            });
          }
        }
      });
    }
  }

  void _reset() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isWorking = true;
      _secondsLeft = _workTime;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: const Text('FocusForge Pomodoro'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isWorking ? '🎯 DEEP FOCUS' : '☕ SHORT BREAK',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _isWorking ? AppTheme.primary : AppTheme.secondary)),
            const SizedBox(height: 36),
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _isWorking ? AppTheme.primary : AppTheme.secondary, width: 8),
              ),
              child: Center(
                child: Text('$m:$s', style: const TextStyle(fontSize: 54, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _toggle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRunning ? AppTheme.secondary : AppTheme.primary,
                    foregroundColor: AppTheme.background,
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  ),
                  child: Text(_isRunning ? 'Pause' : 'Start Focus', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
