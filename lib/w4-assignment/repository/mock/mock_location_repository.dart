import 'package:flutter_y3_t2/w4-assignment/repository/location_repository.dart';

import '../../model/ride/locations.dart';

class MockLocationsRepository implements LocationsRepository {
  @override
  List<Location> getLocations() {
    return [
      Location(name: "Phnom Penh", country: Country.kh),
      Location(name: "Siem Reap", country: Country.kh),
      Location(name: "Battambang", country: Country.kh),
      Location(name: "Sihanoukville", country: Country.kh),
      Location(name: "Kampot", country: Country.kh),
    ];
  }
}
