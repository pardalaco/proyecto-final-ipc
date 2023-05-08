import 'package:flutter/material.dart';
import 'package:drovmar_pfinal/future/drawer.dart';
import 'details_trip.dart';

class BookTrips extends StatefulWidget {
  const BookTrips({
    super.key,
  });

  @override
  State<BookTrips> createState() => _BookTrips();
}

class _BookTrips extends State<BookTrips> {
  final List<Map<String, dynamic>> _bookedTrips = [
    {
      'destination': 'Nueva York',
      'date': '15/06/2023',
      'people': 2,
      'price': 1500,
      'image': 'https://images.unsplash.com/photo-1524503033419-0aeea6d0a8b6',
    },
    {
      'destination': 'París',
      'date': '20/07/2023',
      'people': 1,
      'price': 2000,
      'image': 'https://images.unsplash.com/photo-1566831413664-5c04e912f5b7',
    },
    {
      'destination': 'Tokio',
      'date': '10/08/2023',
      'people': 4,
      'price': 3000,
      'image': 'https://images.unsplash.com/photo-1541698444083-023c97d3f1ae',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: _bookedTrips.length,
        itemBuilder: (context, i) {
          final trip = _bookedTrips[i];
          return ListTile(
            leading: Image.network(trip['image']),
            title: Text(trip['destination']),
            subtitle:
                Text('Fecha: ${trip['date']} - Personas: ${trip['people']}'),
            trailing: Text('\$${trip['price']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailsTrip(
                        heroTag: 'description',
                        iconPath: 'image',
                        price: 3,
                        description: "loremipsum")),
              );
              print('Tocaste el viaje reservado número ${i + 1}');
            },
          );
        },
      ),
    );
  }
}
