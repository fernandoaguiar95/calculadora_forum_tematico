import 'package:calculator/components/text_button_style.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  //recebe as funções passadas como parâmetro para as teclas usarem
  final void Function(String) showOperationData;
  final void Function(String) saveOperator;
  final void Function() calculate;
  final void Function() clearOperations;

  Keyboard(this.showOperationData, this.saveOperator, this.calculate,
      this.clearOperations);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, //ocupa todo o espaço disponível
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              //expande a tecla para a área disponível
              child: Container(
                  alignment: Alignment.center, //alinha no centro
                  child: TextButton(
                    onPressed: () => saveOperator(
                        '%'), //define a função que será chamada pela tecla e passa um parametro
                    child: Text('%'), //define o texto da tecla
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => saveOperator('R'),
                    child: Text('√'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => clearOperations(),
                    child: Text('C'),
                  )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('7'),
                    child: Text('7'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('8'),
                    child: Text('8'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('9'),
                    child: Text('9'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => saveOperator('÷'),
                    child: Text('÷'),
                  )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('4'),
                    child: Text('4'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('5'),
                    child: Text('5'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('6'),
                    child: Text('6'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => saveOperator('x'),
                    child: Text('x'),
                  )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('1'),
                    child: Text('1'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('2'),
                    child: Text('2'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('3'),
                    child: Text('3'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => saveOperator('-'),
                    child: Text('-'),
                  )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('0'),
                    child: Text('0'),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => showOperationData('.'),
                    child: Text(','),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => calculate(),
                    child: Text('='),
                  )),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => saveOperator('+'),
                    child: Text('+'),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
