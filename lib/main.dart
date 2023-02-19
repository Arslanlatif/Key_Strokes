import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension KeyFiltration on RawKeyEvent {
  // bool isDigitKeyWithBackSpaceStroke() {
  // return logicalKey.keyId >= LogicalKeyboardKey.digit0.keyId &&
  //     logicalKey.keyId <= LogicalKeyboardKey.digit9.keyId;
  // &&
  // logicalKey.keyId == LogicalKeyboardKey.backspace.keyId;
  // }

  // bool isDigitWithBackKeyStroke() {
  //   return isDigitKeyWithBackSpaceStroke() ||
  //       logicalKey.keyId == LogicalKeyboardKey.backspace.keyId;
  // }

  bool isEveryThingCheck(int length) {
    if ((length <= 2)) {
      return logicalKey.keyId >= LogicalKeyboardKey.keyA.keyId &&
              logicalKey.keyId <= LogicalKeyboardKey.keyZ.keyId ||
          logicalKey.keyId == LogicalKeyboardKey.backspace.keyId;
    } else {
      return logicalKey.keyId >= LogicalKeyboardKey.digit0.keyId &&
              logicalKey.keyId <= LogicalKeyboardKey.digit9.keyId ||
          logicalKey.keyId == LogicalKeyboardKey.backspace.keyId;

      ;
    }
  }

  // }
  // bool isAlphabetKeyStrokes() =>
  //     logicalKey.keyId >= LogicalKeyboardKey.keyA.keyId &&
  //     logicalKey.keyId <= LogicalKeyboardKey.keyZ.keyId;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _data;

  @override
  void initState() {
    super.initState();
    _data = TextEditingController();
  }

  @override
  void dispose() {
    _data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KeyStrokes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Focus(
                onKey: (node, event) {
                  int length = _data.text.length;
                  if (!(event.isEveryThingCheck(length))) {
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _data,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    )))
          ],
        ),
      ),
    );
  }
}
