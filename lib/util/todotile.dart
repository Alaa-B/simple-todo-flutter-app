import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  const Todotile(
      {super.key,
      required this.onChanged,
      required this.toDoCheck,
      required this.toDoText,
      required this.deleteTask});
  final String toDoText;
  final bool toDoCheck;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
            onPressed: deleteTask,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'delete',
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Checkbox(value: toDoCheck, onChanged: onChanged),
              Text(
                toDoText,
                style: TextStyle(
                    decoration: toDoCheck
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
