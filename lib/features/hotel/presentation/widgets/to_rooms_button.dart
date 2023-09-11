import 'package:flutter/material.dart';
import 'package:tz/common/templates/styles/custom_styles.dart';

import '../../../../common/templates/colors/app_colors.dart';

class ToRoomsButton extends StatelessWidget {
  final String hotelName;
  const ToRoomsButton({super.key, required this.hotelName});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: AppColors.elevatedButtonStroke))),
      child: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, 'rooms_page', arguments: hotelName);
        },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              minimumSize: const Size.fromHeight(50),
            ), child: Text('К выбору номера', style: Theme.of(context).textTheme.elevatedButtonTextStyle,)),
      ),
    );
  }
}
