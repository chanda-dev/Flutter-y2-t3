import 'package:flutter_y3_t2/week4-example/models/locations.dart';
import 'package:flutter_y3_t2/week4-example/repository/locations_repository.dart';

class KhmerLocationRepository extends LocationsRepository {
  final Location sieamReap = Location(name: 'Siem Reap', country: Country.kh);
  final Location phnomPenh = Location(name: 'Phnom Penh', country: Country.kh);

  @override
  List<Location> getLocations() {
    return [sieamReap, phnomPenh];
  }
}
