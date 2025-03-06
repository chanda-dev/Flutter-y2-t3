import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride/locations.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride_pref/ride_pref.dart';
import 'package:flutter_y3_t2/w4-assignment/repository/mock/mock_rides_repository.dart';
import 'package:flutter_y3_t2/w4-assignment/service/rides_service.dart';
import './repository/mock/mock_ride_preferences_repository.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';

void main() {
  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  RidesService.initialize(MockRidesRepository());

  // 2 - Create a test RidePreference
  final T1 = RidePreference(
    departure: const Location(name: "Battambang", country: Country.kh),
    departureDate: DateTime.now(),
    arrival: const Location(name: "SiemReap", country: Country.kh),
    requestedSeats: 1,
  );

  // 3 - Get matching rides from the repository via the service
  final rides = RidesService.instance.getRides(T1, null);

  for (var ride in rides) {
    print(ride);
  }

  // 5 - Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
