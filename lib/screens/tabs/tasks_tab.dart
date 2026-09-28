import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final List<Map<String, dynamic>> _tasks = [
    {"name": "Complete sprint backlog", "done": true},
    {"name": "Review client deliverable", "done": false},
    {"name": "Write 20 pomodoro logs", "done": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Task List'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tasks.length,
        itemBuilder: (context, i) {
          final t = _tasks[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: CheckboxListTile(
              title: Text(t['name']!, style: TextStyle(decoration: t['done'] ? TextDecoration.lineThrough : null)),
              value: t['done'],
              activeColor: AppTheme.primary,
              onChanged: (val) => setState(() => t['done'] = val),
            ),
          );
        },
      ),
    );
  }
}
