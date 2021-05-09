
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2_calculator/home.dart';


class Contactus extends StatefulWidget {
  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Center(
        child: Text("CALCULATOR\nAn electronic calculator is typically a portable electronic device used to perform calculations, ranging from basic arithmetic to complex mathematics.\n\nAhad Shamim\nSP17-BCS-030 ",textAlign: TextAlign.center,),
      ), //<- place where the image appears
    );
  }
}
