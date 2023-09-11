import 'package:flutter/material.dart';

class ToBookingButton extends StatelessWidget {
  const ToBookingButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () {
        Navigator.pushNamed(context, 'booking_page');
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        minimumSize: const Size.fromHeight(50),
      ), child: Text('Выбрать номер', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.white
      ),)),
    );
  }
}
