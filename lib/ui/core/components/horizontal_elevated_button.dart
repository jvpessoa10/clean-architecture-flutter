
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class HorizontalElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;

  const HorizontalElevatedButton({
    required this.text,
    required this.onPress,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(                  
            onPressed: onPress,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor)
            ),
            
          ),
        ),
      ],
    );
  }
}

