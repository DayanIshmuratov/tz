import 'package:flutter/material.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';

import '../../../../common/templates/colors/app_colors.dart';

class AboutBookingWidget extends StatelessWidget {
  final BookingEntity booking;
  const AboutBookingWidget({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row rowWithTwoExpandedWidget(String firstText, String secondText) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              firstText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.grayText,
              ),
            ),
          ),
          Expanded(
            child: Text(
              secondText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowWithTwoExpandedWidget('Вылет из', booking.departure),
            const SizedBox(height: 8),
            rowWithTwoExpandedWidget('Страна, город', booking.arrivalCountry),
            const SizedBox(height: 8),
            rowWithTwoExpandedWidget('Даты', '${booking.tourDateStart} - ${booking.tourDateStop}'),
            const SizedBox(height: 8),
            rowWithTwoExpandedWidget('Кол-во ночей', booking.numberOfNights.toString()),
            const SizedBox(height: 8),
            rowWithTwoExpandedWidget('Отель', booking.hotelName),
            const SizedBox(height: 8),
            rowWithTwoExpandedWidget('Номер', booking.room),
            const SizedBox(height: 8),
            rowWithTwoExpandedWidget('Питание', booking.nutrition),
          ],
        ),
      ),
    );
  }
}
