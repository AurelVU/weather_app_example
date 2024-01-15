  import 'package:flutter/material.dart';

class CityInputScreen extends StatelessWidget {
  const CityInputScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/cityWeatherScreen',
                    arguments: 'Voronezh',
                  );
                },
                child: const Text('Select city')),
          ],
        ),
      ),
    );
  }
}
