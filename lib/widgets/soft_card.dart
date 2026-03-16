import 'package:flutter/material.dart';

class SoftCard extends StatelessWidget {
  final Widget child;

  const SoftCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffeef1f5),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(8, 8),
            blurRadius: 15,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 15,
          ),
        ],
      ),
      child: child,
    );
  }
}
