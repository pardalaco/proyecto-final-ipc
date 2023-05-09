//import 'dart:io';

//import 'package:drovmar_jmirmol_p1/models/products.json';
import 'dart:convert';

import 'package:drovmar_pfinal/models/reservas_models.dart';
import 'package:drovmar_pfinal/views/details_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/views/book_trips.dart';
//import 'dart:io';
import 'dart:developer' as dev;

Future<String> getProducts(BuildContext context) async {
  //var data = await DefaultAssetBundle.of(context)
  //   .loadString("assets/json/products.json'");
  dev.log('HOLA');
  try {
    var data = await rootBundle.loadString('assets/json/reservas.json');
    //var file = File('assets/json/products.json');
    //var data = await file.readAsString();

    dev.log(data.toString());
    //return data;
    return data;
  } catch (e) {
    dev.log(e.toString());

    return '';
  }
}

///En un widget, devolveremos un FutureBuilder, que hará de placeholder hasta que se reciba la información
class FutureReservas extends StatelessWidget {
  const FutureReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          var reservas = Reservas.fromJson(jsonDecode(snapshot.data!));
          final List uiProductrs = reservas.reservas.map((r) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    var route = MaterialPageRoute(
                      builder: (context) => DetailsTrip(
                        heroTag: r.name,
                        location: r.location,
                        iconPath: r.image,
                        price: r.price,
                        description: r.description,
                        stars: r.stars,
                        nigths: r.nigths,
                        entry_date: r.entry_date,
                        departure_date: r.departure_date,
                      ),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: ListTile(
                    leading: Hero(
                      tag: r.name,
                      child: Image.asset(
                        r.image,
                        width: 30,
                      ),
                    ),
                    //trailing: Text("Nº ${product.productId}"),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.name,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 15,
                            ), // se añade el icono de ubicación
                            Text(
                              r.location,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${r.price}€",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                Divider(
                  //color: bgColor.withOpacity(0.6),
                  color: Colors.grey.withOpacity(0.6),
                  //thickness: 1,
                )
              ],
            );
          }).toList();

          return BookTrips(
            reservasJson: uiProductrs,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
      future: getProducts(context),
    ));
  }
}
