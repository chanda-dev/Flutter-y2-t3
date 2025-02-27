import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/theme/theme.dart';
import 'package:flutter_y3_t2/w7-blablacar/widgets/display/bla_list_tile.dart';

class FilterLocationLabel extends StatelessWidget {
  final VoidCallback onPressed;
  final String departure;
  final String arrival;

  final String date;
  final String seat;
  const FilterLocationLabel(
      {super.key,
      required this.onPressed,
      required this.departure,
      required this.arrival,
      required this.date,
      required this.seat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: BlaSpacings.l),
      leading: Icon(Icons.arrow_back),
      title: Row(
        children: [Text(departure), Icon(Icons.arrow_forward), Text(arrival)],
      ),
      subtitle: Row(
        children: [Text(date), Text(','), Text(seat)],
      ),
      trailing: Text(
        'Filter',
        style: TextStyle(color: BlaColors.primary),
      ),
      onTap: onPressed,
    );
  }
}
