import 'package:flutter/material.dart';
import 'package:tz/features/booking/domain/entities/booking_entity.dart';
import 'package:tz/features/hotel/presentation/widgets/rating_widget.dart';

import '../../../../common/templates/colors/app_colors.dart';

class BookingHotelInfoWidget extends StatelessWidget {
  final BookingEntity booking;

  const BookingHotelInfoWidget({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RatingWidget(rating: booking.horating, ratingName: booking.ratingName),
          const SizedBox(height: 8),
          Text(booking.hotelName, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {},
            child: Text(
              booking.hotelAddress,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.blueText,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
