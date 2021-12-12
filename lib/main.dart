import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /// Строка заголовка
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        // Помещение Column внутри Expanded виджета растягивает столбец,
        // чтобы использовать все оставшееся свободное пространство в строке.
        Expanded(
          // Колонки с текстом
          child: Column(
            // Установка crossAxisAlignment свойства для CrossAxisAlignment.start
            // размещает столбец в начале строки
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Помещение первой строки текста внутри Container позволяет добавить отступы.
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        // значок звездочки и текст «41».
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Column(
          children: [
            titleSection,
          ],
        ),
      ),
    );
  }
}
