
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/common/templates/colors/app_colors.dart';
import 'package:tz/features/booking/presentation/page/booking_page.dart';
import 'package:tz/features/booking/presentation/state/booking_cubit.dart';
import 'package:tz/features/payment/presentation/payment_page.dart';
import 'package:tz/features/room/presentation/page/rooms_page.dart';
import 'package:tz/features/room/presentation/state/rooms_cubit.dart';
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
    return MultiBlocProvider(
  providers: [
    BlocProvider<HotelCubit>(
      create: (context) => sl<HotelCubit>()..getData(),
),
    BlocProvider<RoomsCubit>(
      create: (context) => sl<RoomsCubit>(),
    ),
    BlocProvider<BookingCubit>(
      create: (context) => sl<BookingCubit>(),
    ),
  ],
  child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/' : return MaterialPageRoute(builder: (context) => const HotelPage());
            case 'booking_page' : return MaterialPageRoute(builder: (context) => const BookingPage());
            case "rooms_page" :
              final String hotelName = settings.arguments as String;
              return MaterialPageRoute(builder: (context) => RoomsPage(hotelName: hotelName,));
            case 'payment_page' : return MaterialPageRoute(builder: (context) => const PaymentPage());
          }
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.blueText,
            primary: AppColors.blueText,
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
        home: const HotelPage(),
      ),
);
  }
}
