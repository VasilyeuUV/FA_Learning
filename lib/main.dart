import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BLoC with Stream',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// Главная страница
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC with Stream'),
        centerTitle: true,
      ),
      body: Center(
        // - анимированный контейнер
        child: AnimatedContainer(
          height: 100, // размеры контейнера
          width: 100,
          color: Colors.red, // цвет по умолчанию
          duration:
              const Duration(microseconds: 500), // длительность анимации цвета
        ),
      ),

      // место под кнопки. которые будут размещены в ряд внизу справа
      floatingActionButton: Row(
        // - кнопки в ряд
        mainAxisAlignment: MainAxisAlignment.end, // - справа
        children: <Widget>[
          // - первая кнопка (красная)
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {},
          ),

          const SizedBox(width: 10), // - отступ между кнопками

          // вторая кнопка (зелёная)
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
