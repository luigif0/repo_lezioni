
import 'package:esempiotodo/UI/pages/TaskPage.dart';
import 'package:esempiotodo/UI/widgets/TaskTile.dart';
import 'package:esempiotodo/model/Model.dart';
import 'package:esempiotodo/model/objects/Task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  List<Task>? _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = Model.sharedInstance.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _tasks?.length == 0 ?
        Center(
          child: Text("No tasks available"),
        ) :
        ListView.builder(
          itemCount: _tasks?.length ?? 0 + 1,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index >= (_tasks?.length ?? 0)) {
              return MaterialButton(onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    transitionDuration: const Duration(milliseconds: 700),
                    pageBuilder: (BuildContext context, _, __) => TaskPage(title: _tasks?[index].title ?? "None"),
                  ),
                );
              });
            }
            else {
              return TaskTile(
                  task: _tasks![index]
              );
            }
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddTaskPage(),
        child: const Icon(Icons.add),
      ),
    );
  }


  _goToAddTaskPage(){
    setState(() {
      _tasks = Model.sharedInstance.getTasks();
    });
  }

}
