import 'package:flutter_y3_t2/w7-blablacar/model/ride/locations.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations = fakeLocations;
  // TODO for now fake data
  static List<Location> searchLocation(String query) {
    return availableLocations
        .where((loc) => loc.name.toLowerCase().startsWith(query))
        .toList();
  }
}
