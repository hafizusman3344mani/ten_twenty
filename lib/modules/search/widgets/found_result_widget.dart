import 'package:flutter/material.dart';

class FoundResultWidget extends StatelessWidget {
  final int foundResults;
  const FoundResultWidget({super.key, required this.foundResults});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16) + EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Text(
              '$foundResults ${foundResults > 1 ? 'Results found' : 'Result found '} '),
        ],
      ),
    );
  }
}
