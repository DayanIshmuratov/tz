import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tz/common/templates/colors/app_colors.dart';
class HotelServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.grayChip
      ),
      child: Column(
        children: [
          HotelServiceTile(context, Iconsax.emoji_happy, 'Удобства'),
          HotelServiceTile(context, Iconsax.tick_square, 'Что включено'),
          HotelServiceTile(context, Iconsax.close_square4, 'Что не включено'),
        ],
      )
    );
  }

  Widget HotelServiceTile(BuildContext context, IconData icon, String title) {
    return Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(icon, size: 30, color: Colors.black),
                  const SizedBox(height: 16,)
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.darkText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Самое необходимое',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.grayText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Iconsax.arrow_right_3, color: Colors.black),
                      ],
                    ),
                    Divider(
                      color: AppColors.grayText.withOpacity(0.2),
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}