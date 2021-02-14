import 'package:datediff/calculate.dart';
import 'package:datediff/data/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DiffModel _model = DiffModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DiffModel>.value(value: _model),
        ],
        child:
          MaterialApp(
            title: 'Date Diff App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'The Difference Between Two Dates'),
            routes: <String, WidgetBuilder>{
              "/home": (BuildContext context) => MyHomePage(),
              "/calculate": (BuildContext context) => CalculatePage(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate1 = new DateTime(DateTime.now().year - 1,
      DateTime.now().month - 1, DateTime.now().day - 1);
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
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
          children: <Widget>[
            Text(
              'Select the first date:',
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate1(context),
              child: Text("${selectedDate1.toLocal()}".split(' ')[0]),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Select the second date:',
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate2(context),
              child: Text("${selectedDate2.toLocal()}".split(' ')[0]),
            ),
            SizedBox(
              height: 35.0,
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calculate',
                      arguments:
                          CalculatePageArguments(selectedDate1, selectedDate2));
                },
                child: Text('Calculate'))
          ],
        ),
      ),
    );
  }
}
