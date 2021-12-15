import 'dart:async';

import 'package:flutter/material.dart';

/// Файл с классом, реализующий бизнес-логику подхода BLoC-stream

/// Перечисление событий
enum ColorEvent {
  eventRed,
  eventGreen,
}

/// Класс, реализующий бизнеслогику
class ColorBloc {
  /// - значение цвета, который будем менять
  late Color _color = Colors.red; // (красный по умолчанию)

  /// StreamController, который моделирует поток событий и данных
  /// - будем передавать события ColorEvent
  final _inputEventController = StreamController<ColorEvent>();

  /// Геттер для входного потока событий
  /// sink - входной поток, куда пользователь добавляет событие или данные
  /// .sink - добавляем события (данные) в поток
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  /// StreamController, который моделирует поток состояний
  /// - ожидаем получить Цвет
  final _outputStateController = StreamController<Color>();

  /// Геттер для выходного потока состояний
  /// stream - выходной поток
  Stream<Color> get outputStateStream => _outputStateController.stream;

  /// Метод, который будет преобразовывать событие в новое состояние
  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.eventRed) {
      _color = Colors.red;
    } else if (event == ColorEvent.eventGreen) {
      _color = Colors.green;
    } else {
      throw Exception('Wrong Event Type');
    }

    // полученное состояние добавляем в выходной поток состояний
    _outputStateController.sink.add(_color);
  }

  // подписаться на прослушивание выходного потока
  // для чего реализовываем конструктор
  ColorBloc() {
    // - подписываемся на поток,
    // обрабатываем событие пришедшее со стороны UI
    // и трансформируем их в новый state через _mapEventToState
    _inputEventController.stream.listen(_mapEventToState);
  }

  // по окончании работы потоков их нужно закрыть
  // Закрываем контроллерами, т.к. StreamController - это обёртка над потоками
  // через который создаётся сам поток Stream
  void dispose() {
    _inputEventController.close(); // сначала закрываем входной
    _outputStateController.close(); // затем закрываем выходной
  }
}
