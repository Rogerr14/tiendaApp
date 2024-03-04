import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showAlert(BuildContext context, String menssage, ) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(

        title: const Text('Informacion'),
        content: Text(menssage),
        actions: [
          ElevatedButton(
            onPressed: ()=> context.pop(), 
            child: const Text('ok'),),

        ],
      );
    },
  );
}
