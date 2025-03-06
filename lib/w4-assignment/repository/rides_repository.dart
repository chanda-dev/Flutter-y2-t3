import 'package:flutter_y3_t2/w4-assignment/model/ride/ride.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride_pref/ride_pref.dart';
import 'package:flutter_y3_t2/w4-assignment/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference preference, RidesFilter? filter);
}
