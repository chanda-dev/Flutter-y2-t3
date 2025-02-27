import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/model/ride/locations.dart';
import 'package:flutter_y3_t2/w7-blablacar/screens/location/widget/search_field.dart';
import 'package:flutter_y3_t2/w7-blablacar/service/locations_service.dart';
import 'package:flutter_y3_t2/w7-blablacar/theme/theme.dart';

class LocationPicker extends StatefulWidget {
  final Location? initialLocation;
  const LocationPicker({super.key, required this.initialLocation});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final TextEditingController controller = TextEditingController();
  bool hasText = false;
  final List<Location> allLocation = LocationsService.availableLocations;

  List<Location> fillterLocation = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialLocation != null) {
      controller.text = widget.initialLocation!.name.toLowerCase();
    }

    controller.addListener(_updateTextState);
  }

  @override
  void dispose() {
    controller.removeListener(_updateTextState);
    super.dispose();
  }

  void _updateTextState() {
    setState(() {
      hasText = controller.text.isNotEmpty;

      if (hasText == true && controller.text.length >= 2) {
        fillterLocation =
            LocationsService.searchLocation(controller.text.toLowerCase());
      } else {
        fillterLocation = [];
      }
    });
  }

  void clearSearch() {
    setState(() {
      controller.clear();
      fillterLocation.clear();
    });
  }

  void selectLocation(Location location) {
    setState(() {
      Navigator.pop(context, location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BlaColors.white,
          automaticallyImplyLeading: false,
          title: SearchField(
            goBack: () {
              Navigator.pop(context);
            },
            clearSearch: clearSearch,
            controller: controller,
            hasText: hasText,
          ),
        ),
        body: hasText
            ? (ListView.builder(
                itemCount: fillterLocation.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(fillterLocation[index].name),
                    subtitle: Text(fillterLocation[index].country.name),
                    trailing: IconButton(
                        onPressed: () => selectLocation(fillterLocation[index]),
                        icon: Icon(Icons.arrow_forward)),
                    onTap: () => selectLocation(fillterLocation[index]),
                  );
                }))
            : ListTile(
                title: Text('Choose your current location'),
              ));
  }
}
