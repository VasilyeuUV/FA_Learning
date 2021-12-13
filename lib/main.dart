import 'package:flutter/material.dart';

void main() => runApp(const BooksApp());

/// Класс книги
class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

/// Приложение
class BooksApp extends StatefulWidget {
  const BooksApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

///Состояние приложения
class _BooksAppState extends State<BooksApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: const [
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: Scaffold(),
          )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
