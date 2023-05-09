import 'package:flutter/material.dart';
import 'package:drovmar_pfinal/future/future_reservas.dart';

class ProductsDetails extends StatefulWidget {
  final String iconPath;
  final String location;
  final String heroTag;
  final double price;
  final String description;
  final int stars;

  const ProductsDetails({
    super.key,
    required this.heroTag,
    required this.location,
    required this.iconPath,
    required this.price,
    required this.description,
    required this.stars,
  });

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del viaje"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FutureReservas()),
              );
            },
          ),
        ],
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

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _decrementCount();
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors
                                  .blue, // se agrega el color azul al fondo del botón
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child:
                                const Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          '$_count',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        const SizedBox(width: 20.0),
                        GestureDetector(
                          onTap: () {
                            _incrementCount();
                          },
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors
                                  .blue, // se agrega el color azul al fondo del botón
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Nº noches",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "${widget.price}€/noche",
                      style: const TextStyle(
                        fontSize: 20.0,
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
                          "${(widget.price * _count).toStringAsFixed(2)}€",
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
                              Text(
                                "Añadir a la cesta",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          icon: const Icon(Icons.add_shopping_cart,
                              color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // color de fondo del botón
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Aquí va la función que se ejecutará al presionar el botón
                          },
                          label: Row(
                            children: const [
                              SizedBox(width: 10),
                              Text(
                                "Reservar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          icon: const Icon(Icons.monetization_on_outlined,
                              color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // color de fondo del botón
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
