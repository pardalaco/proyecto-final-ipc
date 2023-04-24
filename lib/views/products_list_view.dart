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
        appBar: AppBar(
          title: const Text("Productos"),
        ),
        body: ListView.builder(
          itemCount: widget.productsJson.length,
          itemBuilder: (context, i) => widget.productsJson[i],
        ));
  }
}
