//import 'dart:io';

//import 'package:drovmar_jmirmol_p1/models/products.json';
import 'dart:convert';

import 'package:drovmar_pfinal/models/product_data.dart';
import 'package:drovmar_pfinal/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/views/products_list_view.dart';
import 'package:drovmar_pfinal/models/user_model.dart';
//import 'dart:io';
import 'dart:developer' as dev;

Future<String> getProducts(BuildContext context) async {
  //var data = await DefaultAssetBundle.of(context)
  //   .loadString("assets/json/products.json'");
  dev.log('HOLA');
  try {
    var data = await rootBundle.loadString('assets/json/products.json');
    //var file = File('assets/json/products.json');
    //var data = await file.readAsString();

    //dev.log(data.toString());
    //return data;
    return data;
  } catch (e) {
    dev.log(e.toString());

    return '';
  }
}

///En un widget, devolveremos un FutureBuilder, que hará de placeholder hasta que se reciba la información
class FutureJson extends StatelessWidget {
  final User user;
  const FutureJson({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          var products = Products.fromJson(jsonDecode(snapshot.data!));
          final List uiProductrs = products.products.map((p) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    var route = MaterialPageRoute(
                      builder: (context) => ProductsDetails(
                        heroTag: p.name,
                        location: p.location,
                        iconPath: p.image,
                        price: p.price,
                        description: p.description,
                        stars: p.stars,
                      ),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: ListTile(
                    leading: Hero(
                      tag: p.name,
                      child: Image.asset(
                        p.image,
                        width: 30,
                      ),
                    ),
                    //trailing: Text("Nº ${product.productId}"),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.name,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 15,
                            ), // se añade el icono de ubicación
                            Text(
                              p.location,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${p.price}€",
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

          return ProductsPage(
            productsJson: uiProductrs,
            user: user,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
      future: getProducts(context),
    ));
  }
}
