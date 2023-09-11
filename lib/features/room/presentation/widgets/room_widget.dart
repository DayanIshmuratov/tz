import 'package:flutter/material.dart';
import 'package:tz/common/templates/widgets/peculiarities_widget.dart';
import 'package:tz/features/room/domain/entities/room_entity.dart';
import 'package:tz/features/room/presentation/widgets/about_room_widget.dart';
import 'package:tz/features/room/presentation/widgets/room_price_widget.dart';
import 'package:tz/features/room/presentation/widgets/to_booking_button.dart';

import '../../../../common/templates/widgets/image_slider.dart';

class RoomWidget extends StatelessWidget {
  final RoomEntity room;

  const RoomWidget({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                images: room.imageUrls,
              ),
              const SizedBox(height: 8),
              Text(
                room.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Peculiarities(peculiarities: room.peculiarities),
              const SizedBox(height: 4),
              const AboutRoomWidget(),
              const SizedBox(height: 16),
              RoomPriceWidget(room: room),
              const SizedBox(height: 16),
              const ToBookingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
