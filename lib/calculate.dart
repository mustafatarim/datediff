import 'package:flutter/material.dart';
import 'data/classes/diff.dart';
import 'package:provider/provider.dart';
import 'data/model.dart';

class CalculatePageArguments {
  final DateTime date1;
  final DateTime date2;

  CalculatePageArguments(this.date1, this.date2);
}

class CalculatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CalculatePageArguments args = ModalRoute.of(context).settings.arguments;
    final DateTime date1 = args.date1;
    final DateTime date2 = args.date2;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Results'),
        ),
        body: 
             DiffResultsPage(date1, date2)
          
        ); 
  }
}

class DiffResultsPage extends StatefulWidget {
  final DateTime date1;
  final DateTime date2;

  DiffResultsPage(this.date1, this.date2);

  @override
  createState() => _DiffResultsPageState(date1, date2);
}

class _DiffResultsPageState extends State {
  final DateTime date1;
  final DateTime date2;

  _DiffResultsPageState(this.date1, this.date2);
  initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    final _model = Provider.of<DiffModel>(context, listen: true);
    return new FutureBuilder(
      future: _model.getDiff(date1,date2),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 2,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: CircularProgressIndicator()),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Diff _diff = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //   Container(height: 5.0),
                    ListTile(
                      title: Text('In Years:'),
                      subtitle: Text(_diff.inYears.toString()),
                    ),
                    ListTile(
                      title: Text('In Months:'),
                      subtitle: Text(_diff.inMonths.toString()),
                    ),
                    ListTile(
                      title: Text('In Weeks:'),
                      subtitle: Text(_diff.inWeeks.toString()),
                    ),
                    ListTile(
                      title: Text('In Days:'),
                      subtitle: Text(_diff.inDays.toString()),
                    ),
                    ListTile(
                      title: Text('In Hours:'),
                      subtitle: Text(_diff.inHours.toString()),
                    ),
                    ListTile(
                      title: Text('In Minutes:'),
                      subtitle: Text(_diff.inMinutes.toString()),
                    ),
                    ListTile(
                      title: Text('In Seconds:'),
                      subtitle: Text(_diff.inSeconds.toString()),
                    ),
                  ],
                ),
              );

            }
        }
        return Text('Error: ${snapshot.error}');
      },
    );
  }
}