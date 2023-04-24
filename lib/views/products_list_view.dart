import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final List productsJson;

  const ProductsPage({super.key, required this.productsJson});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.blue, // agregamos el color de fondo azul
              child: SafeArea(
                child: Center(
                  child: Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors
                              .white, // establecemos el color de texto en blanco
                        ),
                  ),
                ),
              ),
            )),
        body: ListView.builder(
          itemCount: widget.productsJson.length,
          itemBuilder: (context, i) => widget.productsJson[i],
        ));
  }
}
