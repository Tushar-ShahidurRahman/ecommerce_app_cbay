import 'package:flutter/material.dart';

class ProductStepperWidget extends StatefulWidget {
  const ProductStepperWidget({Key? key}) : super(key: key);

  @override
  State<ProductStepperWidget> createState() => _ProductStepperWidgetState();
}

class _ProductStepperWidgetState extends State<ProductStepperWidget> {
  int _currentValue = 1;
  final TextEditingController _stepperTEController =
  TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(12, 24), padding: const EdgeInsets.all(0)),
          onPressed: () {
            if (_currentValue > 1) {
              _currentValue--;
              _stepperTEController.text = _currentValue.toString();
            }
          },
          child: const Icon(Icons.remove),
        ),
        SizedBox(
          // alignment: Alignment.center,
          width: 43,
          //If i define height, i can't see the text inside the text field.
          // height: 45,
          child: TextField(
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            controller: _stepperTEController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(12, 24), padding: const EdgeInsets.all(0)),
          onPressed: () {
            if (_currentValue < 20) {
              _currentValue++;
              _stepperTEController.text = _currentValue.toString();
            }
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}