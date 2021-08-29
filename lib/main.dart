import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:python_app/request.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<String> showData()  {
  //   var data =  fetchData(
  //       'http://10.0.2.2:5000/api?query=this%20is%20a%20resting%20house');

  //   print('recieved data $data');
  //   var parsed = jsonDecode(data);
  //   print('Parsed $parsed');
  //   String output = parsed["result"];
  //   print('Extracted ${parsed["result"]}');
  //   return output;
  // }
  String displayText = 'No Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              displayText,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var data=await fetchData('http://10.0.2.2:5000/api?query=this%20is%20a%20resting%20house');
          // var data =
          //     await fetchData('https://jsonplaceholder.typicode.com/albums/1');
          print('data revieved $data');
          var parsed = jsonDecode(data);
          setState(() {
            displayText = parsed['result'];
            print('Recieved Data: ${parsed['result']}');
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
