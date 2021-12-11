import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // применение кастомного шрифта для всего приложения
        fontFamily: 'IndieFlower',
      ),
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
              Image.asset('assets/icons/flutter_logo_icon.png'),

              // Вывод текста добавленным шрифтом
              // - размещение текста
              const Positioned(
                top: 16, // отступ сверху
                left: 115, // отступ слева

                // сам текст
                child: Text(
                  'My custom font',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo,

                    // применение кастомного шрифта для конкретного виджета
                    fontFamily: 'IndieFlower',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
