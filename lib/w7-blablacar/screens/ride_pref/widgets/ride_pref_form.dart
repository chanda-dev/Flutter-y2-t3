import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/screens/location/location_picker.dart';
import 'package:flutter_y3_t2/w7-blablacar/utils/date_time_util.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../widgets/display/bla_divider.dart';
import '../../../widgets/display/bla_list_tile.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;
  String leavingFrom = 'Leaving from';
  String goingTo = 'Going to';
  late DateTime date = DateTime.now();
  Location? tmp;
  String? anotherTmp;
  late String formatDate = DateTimeUtils.formatDateTime(date);
  String peopleAmount = '1';
  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // swap the destination between leaving from and going to

  void selectLocation(bool isDepature) async {
    final selectLocation = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationPicker(
                  initialLocation: isDepature ? departure : arrival,
                )));
    setState(() {
      if (selectLocation != null) {
        if (isDepature) {
          departure = selectLocation;
          leavingFrom = departure!.name;
        } else {
          arrival = selectLocation;
          goingTo = arrival!.name;
        }
      }
    });
  }

  void _handleSwapDirection() {
    setState(() {
      if (leavingFrom != "Leaving from" && goingTo != "Going to") {
        anotherTmp = leavingFrom;
        leavingFrom = goingTo;
        goingTo = anotherTmp!;
        tmp = departure;
        departure = arrival;
        arrival = tmp!;
      } else if (leavingFrom != "Leaving from") {
        goingTo = leavingFrom;
        leavingFrom = 'Leaving from';
        arrival = departure;
        departure = tmp;
      } else if (goingTo != "Going to") {
        leavingFrom = goingTo;
        goingTo = "Going to";
        departure = arrival;
        arrival = tmp;
      }
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlaListTile(
            onClick: () => selectLocation(true),
            text: leavingFrom,
            icon: Icon(Icons.radio_button_unchecked),
            tileOrder: 'first',
            swapDirection: _handleSwapDirection,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: BlaDivider(),
          ),
          BlaListTile(
            onClick: () => selectLocation(false),
            text: goingTo,
            icon: Icon(Icons.radio_button_unchecked),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: BlaDivider(),
          ),
          BlaListTile(
            onClick: () {},
            text: formatDate,
            icon: Icon(Icons.calendar_month),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: BlaDivider(),
          ),
          BlaListTile(
            onClick: () {},
            text: peopleAmount,
            icon: Icon(Icons.person),
          ),
        ]);
  }
}
