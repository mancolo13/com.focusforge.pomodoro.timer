import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AnalyticsTab extends StatelessWidget {
  const AnalyticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productivity Analytics'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text('4.5 hrs', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  const SizedBox(height: 6),
                  const Text('Total Focus Time Today', style: TextStyle(color: AppTheme.textSecondary)),
                  const SizedBox(height: 12),
                  const Text('9 Pomodoro Sessions Completed', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Focus Consistency', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((day) {
                      return Column(
                        children: [
                          Container(
                            width: 32,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(day, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
