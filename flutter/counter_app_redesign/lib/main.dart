import 'package:flutter/material.dart';

void main() {
  runApp(const CounterAppRedesign());
}

class CounterAppRedesign extends StatelessWidget {
  const CounterAppRedesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App Redesign',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF0F4F8),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
          headlineMedium: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const CounterHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterHomePage extends StatefulWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  State<CounterHomePage> createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(context) {
    setState(() {
      if (_counter > 0) _counter--;
    });
    if(_counter <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Counter is 0!',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(seconds: 2),
          )
      );
    }
  }

  void _resetCounter(context) {
    setState(() {
      _counter = 0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Counter has been reset!',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Redesign'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Counter Value',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 20),
                Text(
                  '$_counter',
                  style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _incrementCounter,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: const Text('Increase'),
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(150, 60),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _decrementCounter(context),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      label: const Text('Decrease'),
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(150, 60),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _resetCounter(context),
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(150, 60),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
