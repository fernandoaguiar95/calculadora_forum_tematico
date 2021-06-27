import 'package:flutter/material.dart';

class ModalHistory extends StatelessWidget {
  final List listOperations;

  ModalHistory(this.listOperations);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Histórico de operações',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: listOperations.length,
              itemBuilder: (ctx, index) {
                final operation = listOperations[index];
                return ListTile(
                  //exibe a lista de histórico utilizando o
                  //index para exibir cada string da variável passada por parâmetro, que é uma list
                  title: Text(operation.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
