import 'package:flutter/material.dart';
import 'package:drovmar_pfinal/future/drawer.dart';

class BookTrips extends StatefulWidget {
  const BookTrips({
    super.key,
  });

  @override
  State<BookTrips> createState() => _BookTrips();
}

class _BookTrips extends State<BookTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
    );
  }
}
