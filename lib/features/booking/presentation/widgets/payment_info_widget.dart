import 'package:flutter/material.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';

import '../../../../common/templates/colors/app_colors.dart';

class PaymentInfoWidget extends StatelessWidget {
  final BookingEntity booking;
  const PaymentInfoWidget({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row rowWithTwoWidget(String firstText, String secondText, TextStyle priceTextStyle) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.grayText,
            ),
          ),
          Text(
            secondText,
            style: priceTextStyle
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
          children: [
            rowWithTwoWidget('Тур', '${formatNumberWithSpaces(booking.tourPrice)} ₽',
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(height: 16),
            rowWithTwoWidget('Топливный сбор', '${formatNumberWithSpaces(booking.fuelCharge)} ₽',
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
              ),),
            const SizedBox(height: 16),
            rowWithTwoWidget('Сервисный сбор', '${formatNumberWithSpaces(booking.serviceCharge)} ₽',
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16),
            rowWithTwoWidget('К оплате', '${formatNumberWithSpaces(booking.tourPrice + booking.fuelCharge + booking.serviceCharge)} ₽',
              Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blueText
            ),),
          ],
        ),
      ),
    );
  }

  String formatNumberWithSpaces(int number) {
    String numberStr = number.toString();
    String formattedNumber = '';
    int count = 0;

    for (int i = numberStr.length - 1; i >= 0; i--) {
      formattedNumber = numberStr[i] + formattedNumber;
      count++;
      if (count % 3 == 0 && i > 0) {
        formattedNumber = ' ' + formattedNumber;
      }
    }

    return formattedNumber;
  }
}
