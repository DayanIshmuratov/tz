
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tz/features/hotel/data/datasources/hotel_api_service.dart';
import 'package:tz/features/hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:tz/features/hotel/data/repositories/repository_impl.dart';
import 'package:tz/features/hotel/domain/repositories/repository.dart';
import 'package:tz/features/hotel/domain/usecases/get_hotel.dart';
import 'package:tz/features/hotel/presentation/state/hotel_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HotelCubit(getHotel: sl<GetHotel>()));
  
  sl.registerLazySingleton(() => GetHotel(hotelRepository: sl()));

  sl.registerLazySingleton<HotelRepository>(() => HotelRepositoryImpl(hotelRemoteDataSource: sl(), internetConnectionChecker: sl()));

  sl.registerLazySingleton<HotelRemoteDataSource>(() => HotelRemoteDataSourceImpl(client: sl(), hotelApiService: sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => HotelApiService(Dio(BaseOptions(contentType: 'application/json'))));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}