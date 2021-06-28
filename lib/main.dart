import 'package:adq_bank/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ADQ BANK",
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: ThemeData.light().copyWith(
          iconTheme: IconThemeData(size: 16.0, color: Colors.white),
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ));
  }
}
