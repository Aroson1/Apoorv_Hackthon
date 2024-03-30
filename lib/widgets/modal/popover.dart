import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class Popover extends StatelessWidget {
  const Popover({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: GlassContainer(
        blur: 7,
        border: Border.all(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 2.0,
        ),
        color: const Color.fromRGBO(216, 121, 223, 0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16.0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            // color: theme.cardColor,
            color: const Color.fromRGBO(216, 121, 223, 0.1),

            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildHandle(context), child],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
