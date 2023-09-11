import 'package:flutter/material.dart';
import 'package:tz/features/hotel/domain/entities/hotel_entity.dart';
import 'package:tz/features/hotel/presentation/widgets/rating_widget.dart';

import '../../../../common/templates/colors/app_colors.dart';
import '../../../../common/templates/widgets/image_slider.dart';

class MainInfoHotel extends StatelessWidget {
  final HotelEntity hotel;

  const MainInfoHotel({super.key, required this.hotel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(images: hotel.imageUrls),
          const SizedBox(height: 8),
          RatingWidget(rating: hotel.rating, ratingName: hotel.ratingName,),
          const SizedBox(height: 8),
          Text(hotel.name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(hotel.address, style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.blueText,
            ),
          ),
          const SizedBox(height: 16,),
          RichText(
            text: TextSpan(
            children: [
              TextSpan(text: "От ${hotel.minimalPrice}₽",
                  style: Theme.of(context).textTheme.titleLarge),
              const WidgetSpan(child: SizedBox(width: 16,)),
              TextSpan(text: hotel.priceForIt,
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(color: AppColors.grayText,
                    fontWeight: FontWeight.normal),
              ),
            ]
          ),
          ),
        ],
      ),
    );
  }
}