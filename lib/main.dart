import 'package:flutter/material.dart';
import 'package:news_and_book/screen/books_screen.dart';
import 'package:news_and_book/screen/news_screen.dart';
import 'package:news_and_book/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NEWS AND BOOKS READING APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.new_releases_outlined),
                  FlatButton(
                    focusColor: Colors.red,
                    hoverColor: Colors.green,
                    splashColor: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewsScreenListView(),
                        ),
                      );
                    },
                    child: Text(
                      'NEWS',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.new_label_sharp),
                FlatButton(
                  focusColor: Colors.red,
                  hoverColor: Colors.green,
                  splashColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BooksScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'BOOKS',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            )
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
