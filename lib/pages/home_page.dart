import 'package:flutter/material.dart';
import 'package:to_do_app_local/utilities/dialog.dart';
import 'package:to_do_app_local/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();

  List toDoList = [
    ["Make Tutorial", "About the provider", false],
    ["Go to gym", "It is leg day baby", true]
  ];

  // List<List<dynamic>> reversedToDoList = toDoList.reversed.toList() as List<List<dynamic>>;

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][2] = !toDoList[index][2];
    });
  }

  void cancelDialog() {
    Navigator.of(context).pop();
  }

  //   String capitalizeFirstLetter(String title) {
  //   if(title.isEmpty) {
  //     return title ;
  //   }
  //   return
  //     title = title[0].toUpperCase() + title.substring(1);
  // }
  // Future<String> capitalizeFirstLetter(
  //     BuildContext context, String title) async {
  //   if (title.isEmpty) {
  //     // Show a dialog if the title is empty
  //     await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Please enter a title'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Close the dialog
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     setState(() {
  //       title = title[0].toUpperCase() + title.substring(1);
  //     });
  //   }
  //   return '';
  // }

  // String capitalizeFirstLetterSub(String subTitle) {
  //   if (subTitle.isEmpty) {
  //     return subTitle;
  //   }
  //   return subTitle = subTitle[0].toUpperCase() + subTitle.substring(1);
  // }

  // void saveNewTask() {
  //   setState(() {
  //      capitalizedTitle () {
  //       capitalizeFirstLetter(context, _titleController.text);
  //      }
  //     String capitalizedsubTitle = capitalizeFirstLetterSub(_subtitleController.text);
  //     toDoList.add([capitalizedTitle, capitalizedsubTitle,false]);
  //     // _titleController.text = ''; this also works
  //     _titleController.clear();
  //     _subtitleController.clear();
  //   });
  //     Navigator.of(context).pop();
  // }
  // void saveNewTask() async {
  //   String capitalizedTitle =
  //       await capitalizeFirstLetter(context, _titleController.text);
  //   String capitalizedSubtitle =
  //       capitalizeFirstLetterSub(_subtitleController.text);

  //   if (capitalizedTitle.isNotEmpty) {
  //     setState(() {
  //       toDoList.add([capitalizedTitle, capitalizedSubtitle, false]);
  //       _titleController.clear();
  //       _subtitleController.clear();
  //     });

  //     Navigator.of(context).pop();
  //   }
  // }
  void saveNewTask() {
    setState(() {
      toDoList.add([_titleController.text, _subtitleController.text, false]);
      _titleController.clear();
      _subtitleController.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewToDo() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDialog(
            titleController: _titleController,
            subtitleController: _subtitleController,
            onCancel: cancelDialog,
            onSave: saveNewTask,
          );
        });
  }

  void deleteTodo(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 245, 141),
        title: const Center(
            child: Text(
          'TO DO',
          style: TextStyle(color: Colors.black),
        )),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewToDo,
        child: const Icon(Icons.add),
      ),
      body: toDoList.isEmpty
          ? const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'There is no task!',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'Please add some task',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ))
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  title: toDoList[index][0],
                  subTitle: toDoList[index][1],
                  taskCompleted: toDoList[index][2],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteToDo: (context) => deleteTodo(index),
                );
              },
            ),
    );
  }
}
