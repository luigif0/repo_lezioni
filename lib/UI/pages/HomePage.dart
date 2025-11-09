import 'package:flutter/material.dart';
import 'package:ese_app_web/model/utils/Costants.dart';
import 'package:ese_app_web/model/Model.dart';
import 'package:ese_app_web/model/objects/Task.dart';
import 'package:ese_app_web/UI/widgets/TaskTile.dart'; // nuovo import
import 'package:ese_app_web/UI/pages/TaskPage.dart';

class HomePage extends StatefulWidget {
  final Model model;
  const HomePage({super.key, required this.model});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _handleAdd() {
    widget.model.addTask(_ctrl.text);
    _ctrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.model,
      builder: (context, _) {
        final tasks = widget.model.tasks;

        return Scaffold(
          appBar: AppBar(
            title: const Text(Costants.appName),
            actions: [
              IconButton(
                tooltip: 'Ordina per priorità',
                onPressed: widget.model.sortByPriority,
                icon: const Icon(Icons.sort),
              ),
              IconButton(
                tooltip: 'Svuota tutto',
                onPressed: () {
                  if (tasks.isEmpty) return;
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Conferma'),
                      content: const Text(
                        'Vuoi davvero cancellare tutte le task?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Annulla'),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(context);
                            widget.model.clearAll();
                          },
                          child: const Text('Sì, cancella'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete_sweep_outlined),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(Costants.padding),
            child: Column(
              children: [
                // Input + bottone aggiunta
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _ctrl,
                        decoration: const InputDecoration(
                          labelText: 'Aggiungi una task',
                          hintText: 'Es: Studiare Flutter',
                        ),
                        onSubmitted: (_) => _handleAdd(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton.icon(
                      onPressed: _handleAdd,
                      icon: const Icon(Icons.add),
                      label: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Lista task
                Expanded(
                  child: tasks.isEmpty
                      ? const _EmptyState()
                      : ListView.separated(
                          itemCount: tasks.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final Task t = tasks[index];
                            return TaskTile(
                              task: t,
                              onTap: () => widget.model.toggleTask(t.id),
                              onLongPress: () => widget.model.removeTask(t.id),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Nessuna task. Aggiungine una!', style: Costants.body),
    );
  }
}
