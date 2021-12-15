import 'package:fa_learning/color_bloc.dart';
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

/// Главная страница - виджет с состоянием
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// Главная страница - состояние
class _MyHomePageState extends State<MyHomePage> {
  // Добавляем бизнес-логику в state нашего приложения
  final ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose(); // закрываем все потоки
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC with Stream'),
        centerTitle: true,
      ),
      body: Center(
        // Чтобы UI (нужный нам виджет) мог обновляться согласно изменениям,
        // поступающим от потока stream, виджет отображения должен быть
        // обёрнут в специальный виджет StreamBuilder
        child: StreamBuilder(
          // - поток с данными
          // (в нашем случае - это выходной поток с новым состоянием)
          stream: _bloc.outputStateStream,
          // - инициализация данных, устанавливаем значение по умолчанию
          initialData: Colors.red,
          // - используя получаемые от потока данные, можно перерисовывать виджет
          builder: (context, snapshot) {
            // - анимированный контейнер
            return AnimatedContainer(
              height: 100, // размеры контейнера
              width: 100,
              // - данные получаем через объект async snapshot, который
              // представляет собой иммутабельное представление асинхронного
              // вычисления
              color: snapshot.data as Color?, // - приведение типа
              // длительность анимации цвета
              duration: const Duration(milliseconds: 2000),
            );
          },
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
            onPressed: () {
              // передача события по нажатию кнопки в бизнес-логику
              _bloc.inputEventSink.add(ColorEvent.eventRed);
            },
          ),

          const SizedBox(width: 10), // - отступ между кнопками

          // вторая кнопка (зелёная)
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              // передача события по нажатию кнопки в бизнес-логику
              _bloc.inputEventSink.add(ColorEvent.eventGreen);
            },
          ),
        ],
      ),
    );
  }
}
