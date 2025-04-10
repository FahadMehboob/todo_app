import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.deleteTask,
      required this.onChanged});
  final String taskName;
  final bool taskCompleted;
  final Function(BuildContext)? deleteTask;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              //CheckBox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //Task Name
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
