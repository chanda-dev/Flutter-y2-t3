import 'package:flutter_y3_t2/w4-assignment/model/ride/locations.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride/ride.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride_pref/ride_pref.dart';
import 'package:flutter_y3_t2/w4-assignment/repository/mock/mock_rides_repository.dart';
import 'package:flutter_y3_t2/w4-assignment/service/rides_service.dart';
import 'package:flutter_y3_t2/w4-assignment/utils/date_time_util.dart';

void main() {
  // 1- Initialize the service
  RidesService.initialize(MockRidesRepository());

  // 2- create some test

  final t1Departure = Location(name: 'Battambong', country: Country.kh);
  final t1Arrival = Location(name: 'SiemReap', country: Country.kh);
  final t1 = RidePreference(
      departure: t1Departure,
      departureDate: DateTime.now(),
      arrival: t1Arrival,
      requestedSeats: 1);

  final t1Pets = RidesFilter(acceptPets: false);

  final t2Departure = Location(name: 'Battambong', country: Country.kh);
  final t2Arrival = Location(name: 'SiemReap', country: Country.kh);

  final t2 = RidePreference(
      departure: t2Departure,
      departureDate: DateTime.now(),
      arrival: t2Arrival,
      requestedSeats: 1);
  final t2Pets = RidesFilter(acceptPets: true);

  // get the marchiing ride preference vai the ride service

  final ridesT1 = RidesService.instance.getRides(t1, t1Pets);
  final ridesT2 = RidesService.instance.getRides(t2, t2Pets);

  // print the t1Ride result
  print(
      "for your preference T1 (${t1.departure.name}->${t1.arrival.name},${DateTimeUtils.formatDateTime(t1.departureDate)} ${t1.requestedSeats} passenger ) we found ${ridesT1.length}");
  for (var t1Ride in ridesT1) {
    if (t1Ride.availableSeats == 0) {
      print("warning");
      if (t1Ride.departureDate.hour >= 12) {
        print(
            "${DateTimeUtils.formatTime(t1Ride.departureDate)} pm  with ${t1Ride.driver.firstName}  (${t1Ride.arrivalDateTime.hour - t1Ride.departureDate.hour} hours ) available seats ${t1Ride.availableSeats}");
      } else {
        print(
            "${DateTimeUtils.formatTime(t1Ride.departureDate)} am  with ${t1Ride.driver.firstName}  (${t1Ride.arrivalDateTime.hour - t1Ride.departureDate.hour} hours) available seats ${t1Ride.availableSeats}");
      }
    } else {
      if (t1Ride.departureDate.hour >= 12) {
        print(
            "${DateTimeUtils.formatTime(t1Ride.departureDate)} pm  with ${t1Ride.driver.firstName}  (${t1Ride.arrivalDateTime.hour - t1Ride.departureDate.hour} hours)");
      } else {
        print(
            "${DateTimeUtils.formatTime(t1Ride.departureDate)} am  with ${t1Ride.driver.firstName}  (${t1Ride.arrivalDateTime.hour - t1Ride.departureDate.hour} hours)");
      }
    }
  }

  // print the t2Ride result
  print(
      "for your preference T2 (${t2.departure.name}->${t2.arrival.name},${DateTimeUtils.formatDateTime(t2.departureDate)} ${t2.requestedSeats} passenger ) we found ${ridesT2.length}");
  for (var t2Ride in ridesT2) {
    if (t2Ride.availableSeats == 0) {
      print("warning");
      if (t2Ride.departureDate.hour >= 12) {
        print(
            "${DateTimeUtils.formatTime(t2Ride.departureDate)} pm  with ${t2Ride.driver.firstName}  (${t2Ride.arrivalDateTime.hour - t2Ride.departureDate.hour} hours ) available seats ${t2Ride.availableSeats}");
      } else {
        print(
            "${DateTimeUtils.formatTime(t2Ride.departureDate)} am  with ${t2Ride.driver.firstName}  (${t2Ride.arrivalDateTime.hour - t2Ride.departureDate.hour} hours) available seats ${t2Ride.availableSeats}");
      }
    } else {
      if (t2Ride.departureDate.hour >= 12) {
        print(
            "${DateTimeUtils.formatTime(t2Ride.departureDate)} pm  with ${t2Ride.driver.firstName}  (${t2Ride.arrivalDateTime.hour - t2Ride.departureDate.hour} hours)");
      } else {
        print(
            "${DateTimeUtils.formatTime(t2Ride.departureDate)} am  with ${t2Ride.driver.firstName}  (${t2Ride.arrivalDateTime.hour - t2Ride.departureDate.hour} hours)");
      }
    }
  }
}
