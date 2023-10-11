import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Title"),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.refresh), label: Text("Retry"),),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.refresh), label: Text("Back"),),
          ],
        ),
      ),
    );
  }
}
