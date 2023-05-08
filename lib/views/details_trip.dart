import 'package:flutter/material.dart';
import 'book_trips.dart';

class DetailsTrip extends StatefulWidget {
  final String iconPath;
  final String heroTag;
  final double price;
  final String description;

  const DetailsTrip({
    super.key,
    required this.heroTag,
    required this.iconPath,
    required this.price,
    required this.description,
  });

  @override
  State<DetailsTrip> createState() => _DetailsTrip();
}

class _DetailsTrip extends State<DetailsTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del producto"),
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
                      children: const [
                        Icon(Icons
                            .location_on), // se añade el icono de ubicación
                        Text(
                          "italia", // se muestra la ubicación del producto
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        const SizedBox(width: 5),
                        const Text(
                          "5",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
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
                          "${(widget.price).toStringAsFixed(2)}€",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Aquí va la función que se ejecutará al presionar el botón
                          },
                          label: Row(
                            children: const [
                              SizedBox(width: 10),
                              const Text(
                                "Cancelar reserva",
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
}
