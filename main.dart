import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = TextEditingController();

  final list = <String> [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('My first list'),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller)),
                IconButton(
                    onPressed: () {
                      final text = controller.text;
                      setState(() {
                        list.add(text);
                      });
                      controller.clear();
                    },
                    icon: const Icon(Icons.add)
                ),
              ],
            ),
          ),
          Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];

              return ListTile(title: Text(item),
              );
            },
          ),
          ),
        ],
      ),
    );
  }
}
