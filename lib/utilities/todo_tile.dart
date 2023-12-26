import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  void Function(BuildContext) deleteToDo;

  ToDoTile(
      {required this.title,
      required this.subTitle,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteToDo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteToDo,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(15),
          // ignore: sort_child_properties_last
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: taskCompleted, onChanged: onChanged),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            color: Colors.grey[800],
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined,
                    color: (taskCompleted
                        ? Colors.redAccent.withOpacity(0.7)
                        : Colors.redAccent)),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: taskCompleted
                  ? const Color.fromARGB(237, 2, 124, 69)
                  : const Color.fromARGB(255, 30, 245, 141),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
