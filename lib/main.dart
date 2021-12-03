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
        primarySwatch: Colors.grey,
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
  String searchQuery = '';
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      searchQuery = searchController.text;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onSubmitted: (text) {
                setState(() {
                  searchQuery = text;
                });
                print('Submitted Query: $searchQuery');
              },
              enableSuggestions: true,
              controller: searchController,
              decoration: InputDecoration(
                focusColor: Colors.black,
                suffixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                hintText: 'Search',
              ),
            ),
            Text(displayText, style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var data =
               await fetchData('http://10.0.2.2:5000/api?query=' + searchQuery);
              //await fetchData('http://127.0.0.1:5000/api?query=' +searchQuery);
          // var data =
          //      await fetchData('https://jsonplaceholder.typicode.com/albums/1');
          print('data recieved $data');
          // var parsed = jsonDecode(data);
          String printableData=makePrintableData(data);
          setState(() {
            displayText = "" + printableData;
          });  
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

String makePrintableData(data) {
  //do the processing to remove unwanted JSON stuff
  
  return data;
}
