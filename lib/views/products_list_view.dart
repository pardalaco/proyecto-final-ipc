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
        //automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Daniel Rovira"),
              accountEmail: const Text("drovmar@upv.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/img/profile.png'),
              ),
            ),
            ListTile(
              title: const Text('User Information'),
              onTap: () {},
            ),
            const Spacer(),
            Container(
              color: Colors.black,
              child: ListTile(
                title: const Center(
                  child: Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: widget.productsJson.length,
        itemBuilder: (context, i) => widget.productsJson[i],
      ),
    );
  }
}
