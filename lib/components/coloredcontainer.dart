import 'package:flutter/material.dart';

class ColoredContainer extends StatefulWidget {
  const ColoredContainer({Key? key, required this.child, this.containerColor})
      : super(key: key);

  final Color? containerColor;
  final Widget child;

  @override
  State<ColoredContainer> createState() => _ColoredContainerState();
}

class _ColoredContainerState extends State<ColoredContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: widget.containerColor ?? Colors.blue.withOpacity(0.4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.00),
        child: widget.child,
      ),
    );
  }
}
