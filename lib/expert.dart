import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petitparser/petitparser.dart';
import 'package:s2_calculator/SharePref.dart';
import 'package:s2_calculator/history.dart';

class Expert extends StatefulWidget {
  @override
  _ExpertState createState() => _ExpertState();
}

class _ExpertState extends State<Expert> {
  SharedPref sharedPref = SharedPref();
  TextEditingController TextController = TextEditingController();
  String text = "";
  final parser = buildParser();
  List<String> history = [];
  bool isloading = true;

  List<String> stack = [];
  int i = -1;

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    gethistroy();
    TextController.addListener(() {
      print(TextController.text);
      setState(() {
        stack.add(TextController.text);
        i++;
      });
    });
  }

  gethistroy() async {
    setState(() {
      isloading = true;
    });
    try {
      history = await sharedPref.readlist("history1");
      setState(() {
        isloading = false;
      });
    } catch (e) {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expert"),
          actions: [
            (!isloading)
                ? InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => History(
                            history: history,
                          )));
                },
                child: Icon(Icons.access_time_rounded))
                : SizedBox(),
            SizedBox(
              width: 10,
            ),
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
        body: (!isloading)
            ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 5, bottom: 5),
              child: TextField(
                style: TextStyle(fontSize: 25),
                onChanged: (value) {

                },
                cursorColor: Colors.blue,
                controller: TextController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      if (stack.isNotEmpty && stack != null) {
                        setState(() {
                          if (i <= -1) {
                            TextController.text = "";
                          } else {
                            i--;
                            TextController.text = stack[i];
                          }
                        });
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              'Undo',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () async {
                      if (stack.isNotEmpty && stack != null) {
                        if (i >= stack.length-1) {
                          // setState(() {
                          //   TextController.text = stack[stack.length];
                          // });
                        } else {
                          setState(() {
                            i++;
                            TextController.text = stack[i];
                          });
                        }
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              'Redo',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "6";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '6',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "7";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '7',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "8";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '8',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "9";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '9',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "2";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "3";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "4";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "5";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "0";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "1";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () async {
                      final result = parser.parse(TextController.text);
                      if (result.isSuccess) {
                        history.add(TextController.text +
                            " = " +
                            result.value.toString());
                        sharedPref.save("history1", history);
                        // setState(() {
                        //   TextController.text= result.value.toString();
                        // });
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text('Result'),
                            content: Text(result.value.toString()),
                            actions: <Widget>[
                              new TextButton(
                                onPressed: () {
                                  Navigator.of(context,
                                      rootNavigator: true)
                                      .pop(); // dismisses only the dialog and returns nothing
                                },
                                child: new Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        print(TextController.text);
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text('Result'),
                            content: Text("Syntax Error"),
                            actions: <Widget>[
                              new TextButton(
                                onPressed: () {
                                  Navigator.of(context,
                                      rootNavigator: true)
                                      .pop(); // dismisses only the dialog and returns nothing
                                },
                                child: new Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '=',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "+";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 10.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "-";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "/";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '/',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.text += "*";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              '*',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        TextController.clear();
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 20.0, top: 5, bottom: 5),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                        child: Center(
                            child: Text(
                              'Clear',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ),
                ),
              ],
            ),
          ],
        )
            : Center(
          child: CircularProgressIndicator(),
        ), //<- place where the image appears
      ),
    );
  }
}

Parser buildParser() {
  final builder = ExpressionBuilder();
  builder.group()
    ..primitive((pattern('+-').optional() &
    digit().plus() &
    (char('.') & digit().plus()).optional() &
    (pattern('eE') & pattern('+-').optional() & digit().plus())
        .optional())
        .flatten('number expected')
        .trim()
        .map(num.tryParse))
    ..wrapper(
        char('(').trim(), char(')').trim(), (left, value, right) => value);
  builder.group()..prefix(char('-').trim(), (op, num a) => -a);
  builder.group()..right(char('^').trim(), (num a, op, num b) => pow(a, b));
  builder.group()
    ..left(char('*').trim(), (num a, op, num b) => a * b)
    ..left(char('/').trim(), (num a, op, num b) => a / b);
  builder.group()
    ..left(char('+').trim(), (num a, op, num b) => a + b)
    ..left(char('-').trim(), (num a, op, num b) => a - b);
  return builder.build().end();
}
