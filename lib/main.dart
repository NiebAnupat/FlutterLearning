import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

void main(List<String> args) async {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    print("Get Exchange Rate......");
  }

  void getExchangeRate() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "โปรแกรมแลกเปลี่ยนสกุลเงิน",
        ),
      ),
      body: Text("Flutter Demo"),
    );
  }
}
