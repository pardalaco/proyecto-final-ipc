import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
