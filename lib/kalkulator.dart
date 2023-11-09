import 'package:flutter_application_1/bmikalkulator.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
//import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_application_1/ui/styles/text_styles.dart';
import 'package:flutter_application_1/ui/styles/color_styles.dart';
import 'package:flutter_application_1/ui/constants/contextExtension.dart';

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  int _selectedIndex = 1;
  var userAsk = '';
  var userAnswer = '';

  //button list
  final List<String> buttons = [
    'C',
    'DEL',
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
    '.',
    '0',
    '()',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorStyles.background,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: calculateField(),
              )),
          Expanded(
            flex: 2,
            child: buildContainerButtonsField(),
          ),
        ],
      ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'KalKulator',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate_outlined),
          label: 'BMI',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 0) {
    // Navigasi ke halaman pertama
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else if (index == 1) {
    // Navigasi ke halaman kedua
        Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorHome()));
      } else if (index == 2) {
    // Navigasi ke halaman ketiga
        Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculator()));
      }
      },
    ),  
    );
  }

  Container buildContainerButtonsField() {
    return Container(
      child: GridView.builder(
          itemCount: buttons.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            // Clear Button
            if (index == 0) {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    userAsk = '';
                    userAnswer = '';
                  });
                },
                buttonText: buttons[index],
                color: UIColorStyles.GREEN_MODE,
              );
            }
            // Delete Button
            else if (index == 1) {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    userAsk = userAsk.substring(0, userAsk.length - 1);
                  });
                },
                buttonText: buttons[index],
                color: UIColorStyles.RED_MODE,
              );
            }
            // equal button
            else if (index == buttons.length - 1) {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    equalPressed();
                  });
                },
                buttonText: buttons[index],
                color: UIColorStyles.DEEP_MODE,
              );
            }
            // Normal buttons
            else {
              return CalculatorButton(
                buttonTapped: () {
                  setState(() {
                    userAsk += buttons[index];
                  });
                },
                buttonText: buttons[index],
                color: isOperator(buttons[index])
                    ? Colors.deepOrange
                    : Colors.deepOrange[50],
                textColor: isOperator(buttons[index])
                    ? Colors.white
                    : Colors.deepOrange,
              );
            }
          }),
    );
  }

  Column calculateField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            padding: context.paddingAllow,
            alignment: Alignment.centerLeft,
            child: Text(
              userAsk,
              style: UITextStyles.buttonTextStyle,
            )),
        Container(
            padding: context.paddingAllow,
            alignment: Alignment.centerRight,
            child: Text(
              userAnswer,
              style: UITextStyles.buttonTextStyle,
            )),
      ],
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalAsk = userAsk;
    Parser p = Parser();
    Expression exp = p.parse(finalAsk);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
