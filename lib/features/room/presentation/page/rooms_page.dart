import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tz/common/templates/widgets/app_bar_widget.dart';
import 'package:tz/common/templates/widgets/error_widget.dart';
import 'package:tz/common/templates/widgets/loading_widget.dart';
import 'package:tz/features/room/presentation/state/rooms_cubit.dart';

import '../../../../common/templates/widgets/image_slider.dart';
import '../widgets/room_widget.dart';

class RoomsPage extends StatelessWidget {
  final String hotelName;

  const RoomsPage({super.key, required this.hotelName});
  @override
  Widget build(BuildContext context) {
    context.read<RoomsCubit>().getData();
    return Scaffold(
      appBar: CustomAppBarWidget(
          text: hotelName,
          leadingIcon: const Icon(Iconsax.arrow_left_2)),
      body:
      BlocBuilder<RoomsCubit, RoomsState>(
          builder: (context, state) {
        if (state is RoomsInitial) {
          return const Center(child: Text('Init'));
        }
        if (state is RoomsLoading) {
          return const LoadingWidget();
        }
        if (state is RoomsLoaded) {
          return ListView.builder(
              itemCount: state.rooms.rooms.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    RoomWidget(room: state.rooms.rooms[index]),
                    const SizedBox(height: 16)
                  ],
                );
              });

        }
        if (state is RoomsError) {
          return ErrorTextWidget(message: state.message);
        } else {
          return const ErrorTextWidget(message: 'Неожиданная ошибка');
        }
      }),
    );
  }
}