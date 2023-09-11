import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/common/templates/widgets/error_widget.dart';
import 'package:tz/common/templates/widgets/loading_widget.dart';
import 'package:tz/features/hotel/presentation/state/hotel_cubit.dart';
import '../../../../common/templates/widgets/app_bar_widget.dart';
import '../widgets/about_hotel_widget.dart';
import '../widgets/main_info_hotel.dart';
import '../widgets/to_rooms_button.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(text: 'Отель',),
      body:
        BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              if (state is HotelInitial) {
                return const Center(child: Text('Init'),);
              }
              if (state is HotelLoading) {
                return const LoadingWidget();
              }
              if (state is HotelLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainInfoHotel(hotel: state.hotel),
                      const SizedBox(height: 8),
                      AboutTheHotel(aboutTheHotel: state.hotel.aboutTheHotel),
                      const SizedBox(height: 8),
                      ToRoomsButton(hotelName: state.hotel.name),
                    ],
                  ),
                );
              }
              if (state is HotelError) {
                return ErrorTextWidget(message: state.message);
              } else {
                return const ErrorTextWidget(message: 'Неизвестная ошибка');
              }
            })
    );
  }
}