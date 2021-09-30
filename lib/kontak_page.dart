import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KontakPage extends StatefulWidget {
  const KontakPage({Key? key}) : super(key: key);

  @override
  _KontakPageState createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kontak'),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("Soon..."),
        ),
      ),
    );
  }
}
