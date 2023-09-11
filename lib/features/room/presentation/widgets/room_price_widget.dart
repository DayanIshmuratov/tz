import 'package:flutter/material.dart';
import 'package:tz/features/room/domain/entities/room_entity.dart';

import '../../../../common/templates/colors/app_colors.dart';

class RoomPriceWidget extends StatelessWidget {
  final RoomEntity room;
  const RoomPriceWidget({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(text: "${formatNumberWithSpaces(room.price)} ₽",
                style: Theme.of(context).textTheme.titleLarge),
            const WidgetSpan(child: SizedBox(width: 16,)),
            TextSpan(text: room.pricePer,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: AppColors.grayText,
                  fontWeight: FontWeight.normal),
            ),
          ]
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
