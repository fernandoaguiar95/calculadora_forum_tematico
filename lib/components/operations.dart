import 'package:flutter/material.dart';

class Operations extends StatelessWidget {
  final operations;
  final double resultado;

  Operations(this.operations, this.resultado);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              operations,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              resultado.toString(),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ],
    );
  }
}
