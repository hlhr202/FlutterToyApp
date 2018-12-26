import "package:flutter/material.dart";
import "model/student.dart";
import "service/student.dart";
import "search/api.dart";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;

  void _incrementCounter() {
    searchByString(
        SearchQuery(queryString: "Genkagaku", limit: '20', offset: '0'));
    studentService.updateStudent();
    setState(() {
      _counter++;
    });
  }

  void _reset() {
    studentService.resetStudent();
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: studentService.subject,
              builder: (context, AsyncSnapshot<Student> snapshot) {
                return snapshot.hasData
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text("Student name: ${snapshot.data.name}"),
                            Text("Student gender: ${snapshot.data.gender}"),
                            Text("Student age: ${snapshot.data.age}"),
                          ])
                    : Container();
              },
            ),
            Text(
              'You have pushed: $_counter times',
              style: Theme.of(context).textTheme.body1,
            ),
            Tooltip(
              message: "Reset counter",
              child: RaisedButton(
                color: Colors.deepOrangeAccent,
                onPressed: _reset,
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
