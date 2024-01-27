import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Hand? myHand;
  Hand? computerHand;
  Result? result;

  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(3);
    final hand = Hand.values[randomNumber];
    setState(() {
      computerHand = hand;
    });
    decideResult();
  }

  void decideResult() {
    if (myHand == null || computerHand == null) {
      return;
    }
    final Result result;

    if (myHand == computerHand) {
      result = Result.win;
    } else {
      result = Result.lose;
    }
    setState(() {
      this.result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '相手',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              computerHand?.text ?? '?',
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              result?.text ?? '?',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              myHand?.text ?? '?',
              style: TextStyle(fontSize: 200),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.up;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '☝️',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.down;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '👇',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.left;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '👈',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.right;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '👉',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum Hand {
  up,
  down,
  left,
  right;

  String get text {
    switch (this) {
      case Hand.up:
        return '☝️';
      case Hand.down:
        return '👇';
      case Hand.left:
        return '👈';
      case Hand.right:
        return '👉';
    }
  }
}

enum Result {
  win,
  lose;

  String get text {
    switch (this) {
      case Result.win:
        return '勝ち';
      case Result.lose:
        return '負け';
    }
  }
}
