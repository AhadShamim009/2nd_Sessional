import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s2_calculator/beginner.dart';

class History extends StatefulWidget {
  final List<String> history;

  const History({Key key, this.history}) : super(key: key);
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("History"),
          actions: [
            InkWell(
                onTap: () {
                  SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop');
                },
                child: Icon(Icons.cancel_outlined)),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body:
        (widget.history.length > 0)?
        ListView.builder(
          itemCount: widget.history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: historyview(
                  widget.history[index]),
            );
          },
        )
              : Center(
          child: Text('No History'),
    ), //<- place where the image appears
      ),
    );
  }

  historyview(String h){
    return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0,top: 5,bottom: 5),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Center(child: Text(h)));
  }

}
