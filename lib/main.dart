import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  LinearProgressIndicator(value: 23),
                  Text('23 %',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text('Press button to download',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
          ),
          floatingActionButton: const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.cloud_download),
          ),
        ),
      );
}
