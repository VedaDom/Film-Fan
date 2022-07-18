import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double value;
  const Rating({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: value / 10,
            strokeWidth: 2,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 8,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
