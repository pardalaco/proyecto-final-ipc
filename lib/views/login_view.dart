import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'first_page/container.dart';
//import 'package:drovmar_pfinal/future/alert.dart';
import 'package:drovmar_pfinal/models/user_model.dart';

import '/future/future_json.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          //color: Colors.blue,
          child: Column(children: [
            Container(
                width: double.infinity,
                height: 120,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                //color: Colors.amber,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Travel World",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/img/logo.png',
                        //width: 30,
                      ),
                    ])),
            _LoginBox(),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) => createAlert(
                              context,
                              User(
                                name: _usernameController.text,
                                phone: _phoneController.text,
                              )));
                    }
                  },
                  child: _loginButon(),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }

  _shadow() {
    return const BoxShadow(
      color: Color.fromARGB(69, 39, 39, 39),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(-5, 5),
    );
  }

  // ignore: non_constant_identifier_names
  _LoginBox() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [_shadow()],
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su nombre de usuario';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefono',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su número de teléfono';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loginButon() {
    return Container(
      width: 180,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
      ),
      child: const Center(
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  AlertDialog createAlert(BuildContext context, User user) => AlertDialog(
        title: const Text("Tus datos"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Nombre",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.name,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Teléfono",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.phone,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                debugPrint("Press Cancelar");
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar")),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                debugPrint("Press Aceptar");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FutureJson(user: user)),
                );
              },
              child: const Text("Aceptar")),
        ],
      );
}
