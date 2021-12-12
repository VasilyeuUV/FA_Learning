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
    /// Цвет
    Color color = Theme.of(context).primaryColor;

    /// Строка с кнопками
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Column(
          children: [
            titleSection,
            buttonSection,
          ],
        ),
      ),
    );
  }

  /// Метод, определяющий макет кнопки с иконкой и текстом
  /// label - текст
  /// icon - иконка
  /// color - цвет содержимого
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      // равномерно распределить свободное пространство до, между и после каждого столбца
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Иконка
        Icon(icon, color: color),

        // Контейнер для текста
        Container(
          margin: const EdgeInsets.only(top: 8),

          // Сам текст
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
