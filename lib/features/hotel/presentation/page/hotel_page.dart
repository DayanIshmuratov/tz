import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/common/templates/styles/custom_styles.dart';
import 'package:tz/common/templates/widgets/appBarWidget.dart';
import 'package:tz/common/templates/widgets/image_slider.dart';
import 'package:tz/features/hotel/presentation/state/hotel_cubit.dart';

import '../../../../common/templates/colors/app_colors.dart';
import '../widgets/about_hotel_widget.dart';
import '../widgets/rating_widget.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Отель',),
      body:
        BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              if (state is HotelInitial) {
                return const Center(child: Text('Init'),);
              }
              if (state is HotelLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HotelLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageSlider(images: state.hotel.imageUrls),
                      RatingWidget(rating: state.hotel.rating, ratingName: state.hotel.ratingName,),
                      AboutTheHotelWidget(aboutTheHotel: state.hotel.aboutTheHotel,),

                    ],
                  ),
                );
              }
              if (state is HotelError) {
                return const Center(child: Text('Error'));
              } else {
                return const Center(child: Text('Unexpected Error'));
              }
            })
    );
  }
}