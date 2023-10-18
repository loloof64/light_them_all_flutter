import 'package:flutter/material.dart';
import 'package:light_them_all/light_board_data.dart';
import 'package:light_them_all/lights_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light them all',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Game page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LightBoardData? _boardData;

  @override
  void initState() {
    _boardData = LightBoardData(4);
    super.initState();
  }

  void _onToggle(int row, int col) {
    setState(() {
      _boardData?.toggle(row, col);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_boardData?.isWon ?? false)
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'You won !',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
            ),
          LightBoardWidget(
            boardData: _boardData ?? LightBoardData(4),
            onToggle: _onToggle,
          ),
        ],
      ),
    );
  }
}
