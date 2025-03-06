import 'dart:ffi';

import 'package:flutter_y3_t2/w4-assignment/repository/rides_repository.dart';

import '../model/ride_pref/ride_pref.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static RidesService? _instance;
  final RidesRepository repository;

  RidesService._internal(this.repository);

  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("Ride Service is already initialized");
    }
  }

  static RidesService get instance {
    if (_instance == null) {
      throw Exception(
          "Ride service is not initialized. Call initialize() first");
    }
    return _instance!;
  }

  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }

  static List<Ride> availableRides = fakeRides;

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePreference preferences) {
    // For now, just a test
    return availableRides
        .where((ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival)
        .toList();
  }
}

/// RidesFilter
///
/// handle the specific filters required by
/// the user while researching for rides

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}
