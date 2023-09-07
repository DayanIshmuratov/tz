import 'package:tz/features/hotel/domain/repositories/repository.dart';

import '../entities/hotel_entity.dart';

class GetHotel {
  final HotelRepository hotelRepository;

  GetHotel({required this.hotelRepository});

  Future<HotelEntity> call() async {
    return await hotelRepository.getHotel();
  }
}
