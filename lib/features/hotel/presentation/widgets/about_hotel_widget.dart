import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';

import '../../../../common/templates/colors/app_colors.dart';
import 'hotel_services_widget.dart';

class AboutTheHotel extends StatelessWidget {
  final AboutTheHotelEntity aboutTheHotel;

  const AboutTheHotel({super.key, required this.aboutTheHotel});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Об отеле', style: Theme.of(context).textTheme.titleMedium),
          Wrap(
            spacing: 2.0,
            children: [
            for (var peculiarity in aboutTheHotel.peculiarities)
              Chip(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                label: Text(
                  peculiarity,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grayText,
                  ),
                ),
                backgroundColor: AppColors.grayChip,
              ),
          ],),
          HotelServices(),
        ],
      ),
    );
  }
}