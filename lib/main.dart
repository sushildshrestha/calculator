import 'package:flutter/material.dart';

import 'components/mybuttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  Calculator({super.key});
  List<String> buttonList = [
    'Clear',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return MyButtons(
                    buttonText: buttonList[index],
                    color: isOperator(buttonList[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50],
                    textColor: isOperator(buttonList[index])
                        ? Colors.white
                        : Colors.deepPurple,
                  );
                },
              )))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }
}
