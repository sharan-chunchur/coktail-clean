
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../drinkslist/provider/drinks_provider.dart';


class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    super.key,
    required this.errTitle,
    required this.title,
    required this.onRetry
  });

  final String errTitle;
  final String title;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(errTitle),
            ElevatedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text("Retry"),),
            TextButton.icon(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back), label:const Text("Back"),),
          ],
        ),
      ),
    );
  }
}
