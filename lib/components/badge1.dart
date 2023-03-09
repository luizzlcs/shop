import 'package:flutter/material.dart';

class Badge1 extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  const Badge1({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 6,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color ?? Colors.blue),
            constraints: const BoxConstraints(minWidth: 16, maxWidth: 16),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
