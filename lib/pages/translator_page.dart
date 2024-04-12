import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({Key? key}) : super(key: key);

  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final translator = GoogleTranslator();
  final speech = stt.SpeechToText();
  String _sourceText = '';
  String _translatedText = '';

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    await Permission.microphone.request();
    await Permission.speech.request();

    bool available = await speech.initialize(
      onError: (error) {
        print('Error in speech recognition: $error');
      },
    );
    if (!available) {
      print('Speech recognition not available');
    }
  }

  Future<void> _translateText(String sourceLanguage, String targetLanguage) async {
    if (_sourceText.isNotEmpty) {
      Translation translation = await translator.translate(_sourceText, from: sourceLanguage, to: targetLanguage);
      setState(() {
        _translatedText = translation.text!;
      });
    }
  }

  void _startListening() async {
    if (await speech.isAvailable) {
      speech.listen(
        onResult: (result) {
          setState(() {
            _sourceText = result.recognizedWords;
          });
        },
      );
    } else {
      print('Speech recognition not available');
    }
  }

  void _stopListening() {
    speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _startListening,
              child: const Text('Start Listening'),
            ),
            ElevatedButton(
              onPressed: _stopListening,
              child: const Text('Stop Listening'),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _sourceText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter text to translate...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _translateText('si', 'en'), // Sinhala to English
                  child: const Text('Sinhala-English'),
                ),
                ElevatedButton(
                  onPressed: () => _translateText('en', 'si'), // English to Sinhala
                  child: const Text('English-Sinhala'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _translatedText,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

