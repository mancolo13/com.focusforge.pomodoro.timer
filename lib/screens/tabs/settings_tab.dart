import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool _sound = true;
  bool _autoStart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: const Text('Bell Sound Alert'),
              subtitle: const Text('Chime when interval ends'),
              value: _sound,
              activeColor: AppTheme.primary,
              onChanged: (v) => setState(() => _sound = v),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: SwitchListTile(
              title: const Text('Auto-start Breaks'),
              subtitle: const Text('Start rest timer automatically'),
              value: _autoStart,
              activeColor: AppTheme.primary,
              onChanged: (v) => setState(() => _autoStart = v),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: const Text('Work Duration'),
              trailing: const Text('25 min', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
