import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/templates/colors/app_colors.dart';

class AboutRoomWidget extends StatelessWidget {
  const AboutRoomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.blueText.withOpacity(0.1),
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Подробнее о номере', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.blueText,
            ),
            ),
            const Icon(Iconsax.arrow_right_3, color: AppColors.blueText, size: 20),
          ]
      ),
    );
  }
}
