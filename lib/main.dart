import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/common/templates/colors/app_colors.dart';
import 'package:tz/service_locator/service_locator.dart';
import 'features/hotel/presentation/page/hotel_page.dart';
import 'package:tz/service_locator/service_locator.dart' as di;
import 'features/hotel/presentation/state/hotel_cubit.dart';

void main() async {
  runApp(MyApp());
  await di.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HotelCubit>(
      create: (context) => sl<HotelCubit>()..get(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.blueText,
          ),
          fontFamily: 'SF Pro Display',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
        home: HotelPage(),
      ),
    );
  }
}
