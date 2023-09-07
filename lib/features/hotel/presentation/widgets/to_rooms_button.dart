import 'package:flutter/material.dart';

class ToRoomsButton extends StatelessWidget {
  const ToRoomsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {

        },
        child: Text('К выбору номера', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),),
      ),
    );
  }
}
