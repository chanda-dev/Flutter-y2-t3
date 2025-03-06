import 'package:flutter_y3_t2/w4-assignment/model/ride/locations.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride/ride.dart';
import 'package:flutter_y3_t2/w4-assignment/model/ride_pref/ride_pref.dart';
import 'package:flutter_y3_t2/w4-assignment/model/user/user.dart';
import 'package:flutter_y3_t2/w4-assignment/repository/rides_repository.dart';
import 'package:flutter_y3_t2/w4-assignment/service/rides_service.dart';
import 'package:flutter_y3_t2/w4-assignment/utils/date_time_util.dart';

class MockRidesRepository implements RidesRepository {
  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    final now = DateTime.now();

    final departureToBattabong =
        Location(name: "Battambang", country: Country.kh);
    final arriveSiemReap = Location(name: "SiemReap", country: Country.kh);
    final kannika = User(
        firstName: "Kannika",
        lastName: '',
        email: "kannika@idk.com",
        phone: '',
        profilePicture: '',
        verifiedProfile: true);
    final chaylim = User(
        firstName: "Chaylim",
        lastName: '',
        email: 'chaylim@ngl.com',
        phone: '',
        profilePicture: '',
        verifiedProfile: true);
    final mengTech = User(
        firstName: 'Mengetech',
        lastName: '',
        email: 'mengtech@sigma.com',
        phone: '',
        profilePicture: '',
        verifiedProfile: true);
    final limhao = User(
        firstName: 'Limhao',
        lastName: '',
        email: 'limhao@theking.com',
        phone: '',
        profilePicture: '',
        verifiedProfile: true);
    final sovanda = User(
        firstName: 'Sovanda',
        lastName: '',
        email: 'sovanda@sovanada.com',
        phone: '',
        profilePicture: '',
        verifiedProfile: true);
    return [
      Ride(
          departureLocation: departureToBattabong,
          departureDate: DateTime(now.day, 5, 30),
          arrivalLocation: arriveSiemReap,
          arrivalDateTime: DateTime(now.day, 7, 30),
          driver: kannika,
          availableSeats: 2,
          pricePerSeat: 5.0),
      Ride(
        departureLocation: departureToBattabong,
        departureDate: DateTime(now.day, 20, 0),
        arrivalLocation: arriveSiemReap,
        arrivalDateTime: DateTime(now.day, 22, 0),
        driver: chaylim,
        availableSeats: 0,
        pricePerSeat: 7.0,
      ),
      Ride(
        departureLocation: departureToBattabong,
        departureDate: DateTime(now.day, 5, 0),
        arrivalLocation: arriveSiemReap,
        arrivalDateTime: DateTime(now.day, 8, 0),
        driver: mengTech,
        availableSeats: 1,
        pricePerSeat: 5,
      ),
      Ride(
        departureLocation: departureToBattabong,
        departureDate: DateTime(now.day, 20, 0),
        arrivalLocation: arriveSiemReap,
        arrivalDateTime: DateTime(now.day, 22, 0),
        driver: limhao,
        availableSeats: 2,
        pricePerSeat: 10.0,
      ),
      Ride(
        departureLocation: departureToBattabong,
        departureDate: DateTime(now.day, 5, 0),
        arrivalLocation: arriveSiemReap,
        arrivalDateTime: DateTime(now.day, 8, 0),
        driver: sovanda,
        availableSeats: 1,
        pricePerSeat: 5,
      ),
    ];
  }
}
