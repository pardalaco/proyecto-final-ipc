import 'package:flutter/material.dart';
import 'package:drovmar_pfinal/models/user_model.dart';
import 'package:drovmar_pfinal/future/future_json.dart';

AlertDialog createAlert(BuildContext context, User u) => AlertDialog(
      title: const Text("Tus datos"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Nombre"),
          Text(u.name),
          const Text("Teléfono"),
          Text(u.phone),
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
                MaterialPageRoute(builder: (context) => const FutureJson()),
              );
            },
            child: const Text("Aceptar")),
      ],
    );
