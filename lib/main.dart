import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// Create the widget for the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Flutter App"),
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                "https://www.codemobiles.co.th/online/images/course_shortcut_flutter.png"),
          )
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
