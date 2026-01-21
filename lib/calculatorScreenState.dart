import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {
  
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _resultText = 'Результат: 0';
  Color _resultColor = Colors.black;

  
  void _calculate(String operation) {
    double? n1 = double.tryParse(_num1Controller.text);
    double? n2 = double.tryParse(_num2Controller.text);

    if (n1 == null || n2 == null) {
      setState(() {
        _resultText = 'Введите число!!😡';
        _resultColor = Colors.red;
      });
      return;
    }

    setState(() {
      _resultColor = Colors.black;
      
      if (operation == '+') _resultText = 'Результат: ${n1 + n2}';
      if (operation == '-') _resultText = 'Результат: ${n1 - n2}';
      if (operation == '*') _resultText = 'Результат: ${n1 * n2}';
      if (operation == '/') {
        if (n2 == 0) {
          _resultText = 'Так делить нельзя 😡';
          _resultColor = const Color.fromARGB(255, 255, 17, 0);
        } else {
          _resultText = 'Результат: ${n1 / n2}';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Число 1', filled: true),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: _num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Число 2', filled: true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            Text(
              _resultText,
              style: TextStyle(fontSize: 20, color: _resultColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calculate('+'), child: const Text("+")),
                ElevatedButton(onPressed: () => _calculate('-'), child: const Text("-")),
                ElevatedButton(onPressed: () => _calculate('*'), child: const Text("*")),
                ElevatedButton(onPressed: () => _calculate('/'), child: const Text("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
