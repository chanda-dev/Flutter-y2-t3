import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/model/ride/ride.dart';
import 'package:flutter_y3_t2/w7-blablacar/model/ride_pref/ride_pref.dart';
import 'package:flutter_y3_t2/w7-blablacar/screens/ride/widget/filter_location_label.dart';
import 'package:flutter_y3_t2/w7-blablacar/screens/ride_pref/widgets/ride_pref_form.dart';
import 'package:flutter_y3_t2/w7-blablacar/theme/theme.dart';
import 'package:flutter_y3_t2/w7-blablacar/utils/animations_util.dart';
import 'package:flutter_y3_t2/w7-blablacar/utils/date_time_util.dart';

class RideScreen extends StatefulWidget {
  final List<Ride>? availableRide;
  final RidePref? ridePref;
  const RideScreen({
    super.key,
    this.availableRide,
    this.ridePref,
  });

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  void displayRidePrefForm() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 355,
              decoration: BoxDecoration(
                color: BlaColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(BlaSpacings.radius),
                  bottomRight: Radius.circular(BlaSpacings.radius),
                ),
              ),
              child: RidePrefForm(
                initRidePref: widget.ridePref,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: BlaColors.white,
          automaticallyImplyLeading: false,
          title: Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(0, BlaSpacings.s, 0, BlaSpacings.s),
            decoration: BoxDecoration(
                border: Border.all(color: BlaColors.greyLight),
                borderRadius: BorderRadius.circular(BlaSpacings.radius)),
            child: FilterLocationLabel(
              onPressed: displayRidePrefForm,
              departure: widget.ridePref!.departure.name,
              arrival: widget.ridePref!.arrival.name,
              date:
                  DateTimeUtils.formatDateTime(widget.ridePref!.departureDate),
              seat: widget.ridePref!.requestedSeats.toString(),
            ),
          )),
      body: Container(
        width: 600,
        height: 200,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Departure City: ${widget.ridePref!.departure.name}',
                ),
                Text(
                    'Departure Country: ${widget.ridePref!.departure.country.name}'),
                Text(
                    'Departure Time: ${DateTimeUtils.formatDateTime(widget.ridePref!.departureDate)}'),
                Text(
                  'Arrival City: ${widget.ridePref!.arrival.name}',
                ),
                Text(
                    'Arrival Country: ${widget.ridePref!.arrival.country.name}'),
                Text(
                    'Arrival Time: ${DateTimeUtils.formatDateTime(widget.ridePref!.departureDate)}'),
                Text('request seat: ${widget.ridePref!.requestedSeats}}',
                    style: TextStyle(
                      color: BlaColors.primary,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
