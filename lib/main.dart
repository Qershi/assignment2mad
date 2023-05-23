import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = [
    'Apple',
    'Orange',
    'Rambutan',
  ];

  final images = [
    'assets/images/apple.png',
    'assets/images/orange.png',
    'assets/images/rambutan.png',
  ];

  String? _item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                _item = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_item != null) {
                      showImage(_item);
                    }
                  },
                  child: const Text('Display Choice'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showRandomImage();
                  },
                  child: const Text('I'm Feeling Lucky'),
                ),
              ],
            ),
            Image(
              image: AssetImage(images[_item ?? '']),
            ),
          ],
        ),
      ),
    );
  }

  void showImage(String item) {
    setState(() {
      _item = item;
    });
  }

  void showRandomImage() {
    setState(() {
      _item = items.randomElement();
    });
  }
}
