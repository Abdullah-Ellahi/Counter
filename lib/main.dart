import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tally Counter',
      home: const MyHomePage(title: 'Tally Counter'),
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
  int _counter = 99995;
  bool _darkMode = false;
  String bgImage = 'assets/day.jpg';
  TextStyle _textStyle = TextStyle(fontSize: 22, color: Colors.black);

  void _incrementCounter() {
    setState(() {
      if(_counter < 99999) {
        _counter++;
      }
      else{
        _counter = 0;
      }
    });
  }
  void _toggleDarkMode() {
    setState(() {
      _darkMode = !_darkMode;
      bgImage = (bgImage == 'assets/day.jpg' ? 'assets/night.jpg' : 'assets/day.jpg');
      _textStyle = TextStyle(fontSize: 22, color: _darkMode ? Colors.white : Colors.black);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: _darkMode ? Color(0xFF2E2E2E) : Colors.lightBlue[900],
            title: Text(widget.title,style: TextStyle(color: Colors.white),),
            actions: [
              IconButton(
                icon: Icon(
                  _darkMode ? Icons.brightness_high : Icons.brightness_2,
                  color: Colors.white,
                ),
                onPressed: _toggleDarkMode,
              ),
              ],
            ),
          body: Container(
            alignment: Alignment.center,
            // color: _darkMode ? Colors.black : Colors.white,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage), // Adjust the path accordingly
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              height: 400,
              width: 700,
              margin: EdgeInsets.fromLTRB(8,100,0,150),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/counter.png"), // Adjust the path accordingly
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0,12,0,80),
                  child: Text(
                    '$_counter',
                    style: TextStyle(color: Colors.white,fontSize: 50, fontFamily: 'IndieFlower'),
                    ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 60,
            width: 200,
            child: MaterialButton(
              onPressed: _incrementCounter,
              color: _darkMode ? Color(0xFF2E2E2E) : Colors.white,
              hoverColor: Colors.black,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Set the desired border radius
                side: BorderSide(color: _darkMode ? Colors.white : Colors.black, width: 3), // Set the border color and width
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add,color: _darkMode ? Colors.white : Colors.black,),
                  const SizedBox(width: 20), // Add space between icon and text
                  Text(
                    'Increment',
                    style: _textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
