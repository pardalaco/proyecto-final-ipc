import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsTrip extends StatefulWidget {
  final String iconPath;
  final String heroTag;
  final String location;
  final double price;
  final String description;
  late int stars;
  final int nigths;
  final String entryDate;
  final String departureDate;

  DetailsTrip(
      {super.key,
      required this.heroTag,
      required this.iconPath,
      required this.price,
      required this.description,
      required this.location,
      required this.nigths,
      required this.stars,
      required this.entryDate,
      required this.departureDate});

  @override
  State<DetailsTrip> createState() => _DetailsTrip();
}

class _DetailsTrip extends State<DetailsTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de la reserva"),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Hero(
                  tag: widget.heroTag,
                  child: Image.asset(widget.iconPath),
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(10.0),
                  children: [
                    Text(
                      widget.heroTag,
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons
                            .location_on), // se añade el icono de ubicación
                        Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < widget.stars; i++)
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        for (int i = 0; i < 5 - widget.stars; i++)
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                        const SizedBox(width: 5),
                        Text(
                          widget.stars.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Fecha de entrada: ${widget.entryDate}', //Texto con la fecha de salida
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Fecha de salida: ${widget.departureDate}', //Texto con la fecha de salida
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Text(
                      "Detalles del viaje",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    //const SizedBox(height: double.infinity),
                    const SizedBox(height: 50),

                    Row(
                      children: [
                        Text(
                          "${(widget.price * widget.nigths).toStringAsFixed(2)}€",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => createAlert(context));
                          },
                          label: Row(
                            children: const [
                              SizedBox(width: 10),
                              Text(
                                "Anular reserva",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          icon: const Icon(Icons.remove_shopping_cart_sharp,
                              color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // color de fondo del botón
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  AlertDialog createAlert(BuildContext context) => AlertDialog(
        title: const Text("Aviso"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "¿Seguro de que querer cancelar la reserva?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                debugPrint("Press Anular reserva");
                Navigator.of(context).pop();
              },
              child: const Text("Anular")),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                debugPrint("Press Conservar");
                Navigator.of(context).pop();
              },
              child: const Text("Conservar")),
        ],
      );
}
