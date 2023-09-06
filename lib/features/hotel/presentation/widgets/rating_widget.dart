import 'package:flutter/material.dart';
import 'package:tz/common/templates/colors/app_colors.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final String ratingName;

  const RatingWidget({super.key, required this.rating, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0x33FFC700),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.star, color: AppColors.yellowText, size: 20,),
          const SizedBox(width: 2,),
          Text('$rating $ratingName', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.yellowText,
            ),
          ),
        ],
      )
    );
  }
}