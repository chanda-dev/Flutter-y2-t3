import 'package:flutter_y3_t2/week4-example/models/locations.dart';
import 'package:flutter_y3_t2/week4-example/repository/locations_repository.dart';

class FrenchLocationRepository extends LocationsRepository {
  final Location paris = Location(name: 'Paris', country: Country.france);
  final Location toulouse = Location(name: 'Toulouse', country: Country.france);
  @override
  List<Location> getLocations() {
    return [paris, toulouse];
  }
}
