import '../models/locations.dart';

abstract class LocationsRepository {
  List<Location> getLocations();
}
