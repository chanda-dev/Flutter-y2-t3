import 'package:flutter_y3_t2/week4-example/repository/locations_repository.dart';

import '../models/locations.dart';

class LocationService {
  final LocationsRepository locationsRepository;

  LocationService({required this.locationsRepository});

  List<Location> getLocations() {
    return locationsRepository.getLocations();
  }
}
