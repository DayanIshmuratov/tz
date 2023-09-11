import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';
import 'package:tz/common/templates/widgets/peculiarities_widget.dart';

import '../../../../common/templates/colors/app_colors.dart';
import 'hotel_services_widget.dart';

class AboutTheHotel extends StatelessWidget {
  final AboutTheHotelEntity aboutTheHotel;

  const AboutTheHotel({super.key, required this.aboutTheHotel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Об отеле', style: Theme.of(context).textTheme.titleMedium),
          Peculiarities(peculiarities: aboutTheHotel.peculiarities),
          HotelServices(),
        ],
      ),
    );
  }
}