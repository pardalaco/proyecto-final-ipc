import 'package:flutter/material.dart';
import 'package:drovmar_pfinal/future/future_reservas.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Daniel Rovira"),
            accountEmail: Text("drovmar@upv.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/img/profile.png'),
            ),
          ),
          ListTile(
            title: const Text('Reservas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FutureReservas()),
              );
            },
          ),
          const Spacer(),
          Container(
            color: Colors.black,
            child: ListTile(
              title: const Center(
                child: Text(
                  'Sing out',
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
    );
  }
}
