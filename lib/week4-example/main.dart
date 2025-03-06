import 'package:flutter_y3_t2/week4-example/repository/french_location_repository.dart';
import 'package:flutter_y3_t2/week4-example/repository/khmer_location_repository.dart';
import 'package:flutter_y3_t2/week4-example/service/location_service.dart';

void main() {
  // 1. create service
  LocationService locationService =
      LocationService(locationsRepository: FrenchLocationRepository());

  LocationService khmerLocationService =
      LocationService(locationsRepository: KhmerLocationRepository());
  // 2. use the service

  print(locationService.getLocations());

  print(khmerLocationService.getLocations().first);
}
