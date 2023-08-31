import 'package:camera/camera.dart';
import 'package:even_split/screens/scanner/scan.dart';
import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:even_split/screens/scanner/confirm_scan.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/capybara.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.only(top: 500.0),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50.0),
              child: Expanded(
                child: RichText(
                  text: const TextSpan(
                      text: 'Copybara',
                      style: TextStyle(
                          fontFamily: "Serif",
                          fontSize: 40,
                          color: Colors.black)),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 30.0, right: 25.0, left: 25.0),
              child: Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text:
                        'Emi the capybara is here to help you scan and translate all your documents!',
                    style: TextStyle(
                        fontFamily: "Serif", fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: FloatingActionButton(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.brown,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScanScreen()),
                    );
                  },
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ],
        ));
    //return const Image(image: AssetImage('assets/capybara.png'));
  }
}
