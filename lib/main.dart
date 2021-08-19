import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'models/animated_text_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Text',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<AnimatedTextExample> _examples;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _examples = animatedTextExamples();
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = _examples[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          animatedTextExample.label,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: animatedTextExample.color),
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Center(
          key: ValueKey(animatedTextExample.label),
          child: animatedTextExample.child,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index = ++_index % _examples.length;
          });
        },
        tooltip: 'Next',
        child: const Icon(
          Icons.code_rounded,
          size: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.brown,
        mini: true,
      ),
    );
  }
}

// Colorize Text Style
const _colorizeTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Horizon',
);

// Colorize Colors
const _colorizeColors = [
  Colors.green,
  Colors.yellow,
  Colors.red,
];

List<AnimatedTextExample> animatedTextExamples({VoidCallback? onTap}) =>
    <AnimatedTextExample>[
      AnimatedTextExample(
        label: 'Technologies',
        color: Colors.teal[700],
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 100.0,
                  height: 100.0,
                ),
                const Text(
                  '💻',
                  style: TextStyle(fontSize: 43.0),
                ),
                const SizedBox(
                  width: 25.0,
                  height: 100.0,
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Dart'),
                      RotateAnimatedText('Dotnet'),
                      RotateAnimatedText('Java'),
                      RotateAnimatedText('Javascript'),
                      RotateAnimatedText('Python'),
                      RotateAnimatedText('SQL'),
                      RotateAnimatedText('R'),
                      RotateAnimatedText('TypeScript'),
                    ],
                    isRepeatingAnimation: true,
                    totalRepeatCount: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      AnimatedTextExample(
        label: 'Frameworks & libraries',
        color: Colors.lightBlue,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Flutter'),
              TyperAnimatedText('React'),
              TyperAnimatedText('Redux'),
              TyperAnimatedText('Angular'),
            ],
            isRepeatingAnimation: true,
            totalRepeatCount: 10,
          ),
        ),
      ),
      AnimatedTextExample(
        label: 'Important',
        color: Colors.orange,
        child: SizedBox(
          width: 300.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontFamily: 'Horizon',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('</>If you can imagine it</>',
                    cursor: '|'),
                TypewriterAnimatedText('</>You can program it</>', cursor: '|'),
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10,
            ),
          ),
        ),
      ),
      AnimatedTextExample(
        label: 'Developer',
        color: Colors.deepPurple,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Full Stack',
              textStyle: _colorizeTextStyle,
              colors: _colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
          totalRepeatCount: 10,
        ),
      ),
    ];
