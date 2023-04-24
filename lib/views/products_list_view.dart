import 'package:flutter/material.dart';
import 'package:drovmar_pfinal/views/user_information.dart';

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
          automaticallyImplyLeading: false,
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserInfoScreen(
                      userName: "John Doe",
                      userEmail: "johndoe@example.com",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: widget.productsJson.length,
          itemBuilder: (context, i) => widget.productsJson[i],
        ));
  }
}
