import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';

  var displayOutput = '';

  List<String> buttonList = [
    'Clear',
    'Del',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
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
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Display Input Container
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                //Display Output Container
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    displayOutput,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttonList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        //Clear button
                        if (index == 0) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                userInput = '';
                                displayOutput = '';
                              });
                            },
                            buttonText: buttonList[index],
                            color: Colors.green,
                            textColor: Colors.white,
                          );
                        }
                        //Del button
                        else if (index == 1) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            },
                            buttonText: buttonList[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                        //Answer button
                        else if (index == buttonList.length - 2) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                equalButton();
                              });
                            },
                            buttonText: buttonList[index],
                            color: isOperator(buttonList[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttonList[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                        //Equal button
                        else if (index == buttonList.length - 1) {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                equalButton();
                              });
                            },
                            buttonText: buttonList[index],
                            color: isOperator(buttonList[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttonList[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                        //rest of the buttons
                        else {
                          return MyButtons(
                            onTap: () {
                              setState(() {
                                userInput += buttonList[index];
                              });
                            },
                            buttonText: buttonList[index],
                            color: isOperator(buttonList[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttonList[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      })))
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

  equalButton() {
    String Operation = userInput;
    Operation = Operation.replaceAll('x', '*');

    Parser parser = Parser();
    Expression expression = parser.parse(Operation);
    ContextModel contextModel = ContextModel();
    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);

    displayOutput = evaluate.toString();
  }
}
