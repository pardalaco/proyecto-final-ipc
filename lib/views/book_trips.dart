import 'package:flutter/material.dart';
import 'details_trip.dart';

class BookTrips extends StatefulWidget {
  final List reservasJson;

  const BookTrips({super.key, required this.reservasJson});

  @override
  State<BookTrips> createState() => _BookTrips();
}

class _BookTrips extends State<BookTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text("Reservas"),
      ),
      body: ListView.builder(
        itemCount: widget.reservasJson.length,
        itemBuilder: (context, i) => widget.reservasJson[i],
      ),
    );
  }
}
