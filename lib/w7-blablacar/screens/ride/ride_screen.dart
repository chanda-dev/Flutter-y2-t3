import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/model/ride/ride.dart';
import 'package:flutter_y3_t2/w7-blablacar/theme/theme.dart';

class RideScreen extends StatefulWidget {
  final List<Ride> availableRide;

  const RideScreen({super.key, required this.availableRide});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Rides')),
      body: widget.availableRide.isEmpty
          ? Center(child: Text('No Rides Available'))
          : ListView.builder(
              itemCount: widget.availableRide.length,
              itemBuilder: (context, index) {
                var ride = widget.availableRide[index];
                String driverName =
                    '${ride.driver.firstName} ${ride.driver.lastName}';
                String price = ride.pricePerSeat.toString();

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Departure City: ${ride.departureLocation.name}',
                        ),
                        Text(
                            'Departure Country: ${ride.departureLocation.country.name}'),
                        Text('Departure Time: ${ride.departureDate}'),
                        Text(
                          'Arrival City: ${ride.arrivalLocation.name}',
                        ),
                        Text(
                            'Arrival Country: ${ride.arrivalLocation.country.name}'),
                        Text('Arrival Time: ${ride.arrivalDateTime}'),
                        Text('Price: \$${price}',
                            style: TextStyle(
                              color: BlaColors.primary,
                            )),
                        Text('Driver: $driverName'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
