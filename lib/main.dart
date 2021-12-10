import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adding Assets'),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand, // выравнивание посередине
            children: <Widget>[
              // использование виджета AssetImage
              const Image(
                image: AssetImage('assets/images/marmor.jpg'),
              ),

              // Класс (более короткая запись использования виджета AssetImage)
              Image.asset('assets/icons/flutter_logo_icon.png')
            ],
          ),
        ),
      ),
    );
  }
}
