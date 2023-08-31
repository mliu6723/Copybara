import 'package:even_split/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:even_split/widgets/temp.dart';
import 'package:even_split/screens/scanner/scan.dart';
import 'package:even_split/screens/scanner/confirm_scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Even Split',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Camera Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Copybara',
        theme: ThemeData(
          primaryColor: Colors.teal,
          backgroundColor: Colors.white,
        ),
        home: const HomePage());
  }
}
