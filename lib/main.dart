// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'covidCase.dart';

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
    getCovidCaseToday();
  }

  var _data;
  Future<List<covidCase>> getCovidCaseToday() async {
    print("Get Exchange Rate......");
    var url = Uri(
      scheme: 'https',
      host: 'covid19.ddc.moph.go.th',
      path: '/api/Cases/today-cases-all',
    );
    var response = await http.get(url);
    _data = covidCaseFromJson(response.body);
    return _data;
  }

  @override
  Widget build(BuildContext context) {
    var data = _data;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "โปรแกรมรายงานผลโควิด-19",
          ),
        ),
      ),
      body: FutureBuilder(
          future: getCovidCaseToday(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              return ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("จำนวนผู้ป่วยทั้งหมด"),
                    subtitle: Text("${result[0]?.totalCase ?? 0} คน"),
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("จำนวนผู้ป่วยวันนี้"),
                    subtitle: Text("${result[0]?.newCase ?? 0} คน"),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("จำนวนผู้เสียชีวิตทั้งหมด"),
                    subtitle: Text("${result[0]?.totalDeath ?? 0} คน"),
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("จำนวนผู้เสียชีวิตวันนี้"),
                    subtitle: Text("${result[0]?.newDeath ?? 0} คน"),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("จำนวนผู้ป่วยรักษาทั้งหมด"),
                    subtitle: Text("${result[0]?.totalRecovered ?? 0} คน"),
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("จำนวนผู้ป่วยรักษาวันนี้"),
                    subtitle: Text("${result[0]?.newRecovered ?? 0} คน"),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.date_range),
                    title:
                        Text("ข้อมูล ณ วันที่ ${result[0]?.updateDate ?? 0}"),
                  ),
                ],
              );
            } else {
              return LinearProgressIndicator();
            }
          }),
    );
  }
}
