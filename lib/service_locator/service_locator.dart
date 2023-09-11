
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tz/features/booking/data/data_sources/booking_remote_data_source.dart';
import 'package:tz/features/booking/data/repository_impl/booking_repository_impl.dart';
import 'package:tz/features/booking/domain/repository/booking_repository.dart';
import 'package:tz/features/booking/domain/usecases/get_booking.dart';
import 'package:tz/features/booking/presentation/state/booking_cubit.dart';
import 'package:tz/features/hotel/data/datasources/hotel_api_service.dart';
import 'package:tz/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:tz/features/hotel/data/repositories/repository_impl.dart';
import 'package:tz/features/hotel/domain/repositories/repository.dart';
import 'package:tz/features/hotel/domain/usecases/get_hotel.dart';
import 'package:tz/features/hotel/presentation/state/hotel_cubit.dart';
import 'package:dio/dio.dart';
import 'package:tz/features/room/data/datasources/room_api_service.dart';
import 'package:tz/features/room/data/datasources/room_remote_data_source.dart';
import 'package:tz/features/room/data/repository_impl/room_repository_impl.dart';
import 'package:tz/features/room/domain/repository/room_repository.dart';
import 'package:tz/features/room/presentation/state/rooms_cubit.dart';

import '../features/booking/data/data_sources/booking_api_service.dart';
import '../features/room/domain/usecases/get_rooms.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HotelCubit(getHotel: sl<GetHotel>()));
  sl.registerFactory(() => RoomsCubit(getRooms: sl<GetRooms>()));
  sl.registerFactory(() => BookingCubit(getBooking: sl<GetBooking>()));
  
  sl.registerLazySingleton(() => GetHotel(hotelRepository: sl()));
  sl.registerLazySingleton(() => GetRooms(roomRepository: sl()));
  sl.registerLazySingleton(() => GetBooking(bookingRepository: sl()));

  sl.registerLazySingleton<HotelRepository>(() => HotelRepositoryImpl(hotelRemoteDataSource: sl(), internetConnectionChecker: sl()));
  sl.registerLazySingleton<RoomRepository>(() => RoomRepositoryImpl(roomRemoteDataSource: sl(), internetConnectionChecker: sl()));
  sl.registerLazySingleton<BookingRepository>(() => BookingRepositoryImpl(bookingRemoteDataSource: sl(), internetConnectionChecker: sl()));

  sl.registerLazySingleton<HotelRemoteDataSource>(() => HotelRemoteDataSourceImpl(hotelApiService: sl()));
  sl.registerLazySingleton<RoomRemoteDataSource>(() => RoomRemoteDataSourceImpl(roomApiService: sl()));
  sl.registerLazySingleton<BookingRemoteDataSource>(() => BookingRemoteDataSourceImpl(bookingApiService: sl()));


  sl.registerLazySingleton(() => HotelApiService(Dio(BaseOptions(contentType: 'application/json'))));
  sl.registerLazySingleton(() => RoomApiService(Dio(BaseOptions(contentType: 'application/json'))));
  sl.registerLazySingleton(() => BookingApiService(Dio(BaseOptions(contentType: 'application/json'))));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}