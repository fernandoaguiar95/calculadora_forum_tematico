import 'dart:math';

import 'package:calculator/components/keyboard.dart';
import 'package:calculator/components/modal_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/operations.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //define o título da tela
      home: MyHomePage(title: 'Calculadora Topzera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //inicializa as variáveis que serão utilzadas nos cálculos
  String operationData = ''; //número atual sendo digital
  String showOperation =
      ''; //operação completa armazenada em string para exibir na tela e histórico
  String op = ''; //salva o operador selecionado
  double num1 = 0.0;
  double num2 = 0.0;
  double resultado = 0.0;
  bool verifyer = false; //verifica se já existe um resultado
  bool percentage = false; //verifica se o % foi clicado
  List operationsHistory = []; //armazena as operações feitas

  _showHistory(BuildContext context) {
    //chama o modal para exibir o histórico de operações feitas
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ModalHistory(operationsHistory);
      },
    );
  }

  _showOperationData(String texto) {
    //função acionada ao tocar em algum número do teclado
    //serve para concatenar os números e amarzenar o cálculo atual numa varivável
    if (verifyer) {
      //verifica se já existe um resultado, se existir zera a operação e começa um novo
      _clearOperations();
      setState(() {
        operationData += texto;
        showOperation += texto;
      });
    } else if (!verifyer) {
      setState(() {
        operationData += texto;
        showOperation += texto;
      });
    }
  }

  _saveOperator(String opButton) {
    //salva o operador selecionado
    switch (opButton) {
      case 'R':
        if (op == '' && operationData != '') {
          //verifica se não existe operador e se já tem algum número digitado
          op = opButton; //salva o operador
          num1 = double.parse(operationData); //define o num1
          operationData = '0';
          setState(() {
            showOperation += ' √ ';
          });
          _calculate();
        } else if (op != '' && operationData == '') {
          return;
        }
        break;
      case '%':
        if (op != '' && operationData != '') {
          //verifica se já tem operador para ai sim definir porcentagem
          setState(() {
            percentage = true;
            showOperation += '$opButton';
          });
        }
        break;
      default: //ação padrão caso não seja raiz ou %
        if (op != '' && operationData != '') {
          print('1');
          return;
        } else if (op != '' && operationData == '') {
          op = opButton;

          setState(() {
            showOperation = '$num1 $opButton ';
          });
        } else {
          op = opButton;
          num1 = double.parse(operationData);
          operationData = '';
          setState(() {
            showOperation += ' $opButton ';
          });
        }
    }
  }

  _calculate() {
    //função onde os cálculos são feitos ao apertar o simbolo "=" ou "R(RAIZ)" ou "%"
    num2 = double.parse(
        operationData); //define o num2, convertando a string da variavel em double

    if (verifyer == true)
      return; //se já existir um resultado clicando em "=" não faz nada

    if (percentage) {
      //se for porcentagem só executa adição e soma
      switch (op) {
        case '+':
          setState(() {
            resultado = num1 + (num1 * (num2 / 100));
            resultado.toStringAsPrecision(2);
            percentage = false;
            verifyer = true;
          });
          break;
        case '-':
          setState(() {
            resultado = num1 - (num1 * (num2 / 100));
            percentage = false;
            verifyer = true;
          });
          break;
      }
    } else {
      switch (op) {
        case '+': //verifica qual o operador e executa o cálculo de acordo
          setState(() {
            resultado = num1 + num2;
            resultado.toStringAsPrecision(2);
            verifyer = true;
          });
          break;
        case '÷':
          setState(() {
            resultado = num1 / num2;
            verifyer = true;
          });
          break;
        case 'x':
          setState(() {
            resultado = num1 * num2;
            verifyer = true;
          });
          break;
        case '-':
          setState(() {
            resultado = num1 - num2;
            verifyer = true;
          });
          break;
        case 'R':
          setState(() {
            resultado = sqrt(num1);
            verifyer = true;
          });
          break;
      }
    }

    _saveOperationHistory(showOperation,
        resultado.toString()); //chama função para armazenar no histórico
    //passa a variável que armazena a operação toda e também o resultado
  }

  _clearOperations() {
    setState(() {
      //zera todas as variáveis utilizadas, zerando a operação
      showOperation = '';
      operationData = '';
      op = '';
      resultado = 0;
      num1 = 0;
      num2 = 0;
      verifyer = false;
    });
  }

  _saveOperationHistory(String operationsFinal, String result) {
    operationsHistory.add('$operationsFinal = $result');
    //salva a operação no histórico fazendo interpolação de strings/variáveis e criando uma nova
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(title: Text(widget.title), actions: [
      IconButton(
        icon: Icon(Icons.history),
        onPressed: () => _showHistory(
            context), //cria o botão de histórico na appbar e passar uma função
      ),
    ]);

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    //verifica o tamanho disponivel para uso, removendo o tamanho usado pela appbar
    //e também a barra de notificações

    return Scaffold(
      appBar: appBar,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height:
                availableHeight * 0.3, //define o tamanho através de porcentagem
            child: Operations(showOperation,
                resultado), //chama o widget que mostra as operações
          ),
          Container(
            height: availableHeight * 0.7,
            child: Keyboard(
              //chama o teclado e passa as funções que serão utilizadas pelas teclas
              _showOperationData,
              _saveOperator,
              _calculate,
              _clearOperations,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
        ],
      )),
    );
  }
}
