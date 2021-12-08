import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Класс виджета, имеющего состояние
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState(); // класс состояния виджета
  }
}

/// Класс состояния виджета
class _MyFirstAppState extends State<MyApp> {
  bool _loading =
      false; // динамическая переменная - флаг загрузки (идёт или нет)
  // late - инициализируем позже notNullable поле
  late double _progressValue; // отображение процента загрузки файла

  @override
  void initState() {
    // здесь задаются начальные значения для динамических переменных
    _progressValue = 0.0;

    super.initState(); // метод суперкласса (типа конструктор),
    // вызывается один раз, когда объект вставляется в дерево виджетов
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter StatelessWidget Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            title: const Text("StatelessWidget Example"),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: _loading // если загрузка пошла, то отображаем процесс
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LinearProgressIndicator(value: _progressValue),
                        Text('${(_progressValue * 100).round()}%',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ],
                    )
                  : const Text(
                      'Press button to download', // иначе выводим текст
                      style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // setState - уведомить Flutter об изменении state переменной (или объекта)
              setState(() {
                // при нажатии на кнопку изменяем флаг загрузки на противоположный
                _loading = !_loading;
                // имитируем загрузку в отдельном методе этого класса
                _updateProgress();
              });
            },
            child: const Icon(Icons.cloud_download),
          ),
        ),
      );

  /// имитируем загрузку
  void _updateProgress() {
    // Пример таймера
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue > 1.0) {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
