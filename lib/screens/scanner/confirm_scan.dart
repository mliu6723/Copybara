import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  final String text;
  const ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double _currentSliderValue = 0;
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    speak() async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.speak(widget.text);
    }

    stop() async {
      await flutterTts.stop();
    }

    _launchURL() async {
      final Uri url = Uri.parse('https://translate.google.com/');
      if (!await launchUrl(url)) {
        throw Exception("Could not launch");
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('Result'),
          backgroundColor: Colors.brown,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.translate),
              tooltip: 'Translate text',
              onPressed: () {
                _launchURL();
              },
            ),
            IconButton(
              icon: const Icon(Icons.copy),
              tooltip: 'Copy text',
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.text));
              },
            ),
            IconButton(
              icon: const Icon(Icons.volume_up_sharp),
              tooltip: 'Text to speech',
              onPressed: () {
                speak();
              },
            ),
            IconButton(
              icon: const Icon(Icons.volume_off_sharp),
              tooltip: 'Text to speech off',
              onPressed: () {
                stop();
              },
            ),
            IconButton(
              icon: const Icon(Icons.font_download_rounded),
              tooltip: 'Change font',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            contentPadding: const EdgeInsets.only(top: 150.0),
                            title: const Text("Font Size"),
                            actions: [
                              StatefulBuilder(builder: (context, state) {
                                return Slider(
                                  value: _currentSliderValue,
                                  max: 100,
                                  divisions: 5,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    state(() {
                                      _currentSliderValue = value;
                                    });
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                );
                              })
                            ]));
              },
            )
          ]),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Text(widget.text,
            style: TextStyle(fontSize: _currentSliderValue + 30)),
      ),
    );
  }
}
