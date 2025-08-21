import 'package:flutter/material.dart';

enum Understanding { yes, no, none }

class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});

  @override
  State<DemoButtons> createState() => _DemoButtonsState();
}

class _DemoButtonsState extends State<DemoButtons> {
  Understanding _understanding = Understanding.none;

  void _updateUnderstanding(Understanding value) {
    setState(() => _understanding = value);
  }

  @override
  Widget build(BuildContext context) {
    print('DemoButtons BUILD called');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('No', Understanding.no),
            const SizedBox(width: 8),
            _buildButton('Yes', Understanding.yes),
          ],
        ),
        if (_understanding == Understanding.yes)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Awesome!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  Widget _buildButton(String label, Understanding value) {
    final bool isSelected = _understanding == value;

    return TextButton(
      onPressed: () => _updateUnderstanding(value),
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.blue,
        backgroundColor: isSelected ? Colors.blue : null,
      ),
      child: Text(label),
    );
  }
}
