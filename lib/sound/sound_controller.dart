import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:soundpool/soundpool.dart';
import 'package:text_to_speech/text_to_speech.dart';

import 'models/sound.dart';

class SoundController with ChangeNotifier {
  SoundController() {
    language = 'fr-FR';
    initSound();
    initTts();
  }

  late Soundpool soundpool;
  final owoumbaoue = Sound(path: 'assets/sounds/owoumbaoue.mp3');
  final correct = Sound(path: 'assets/sounds/saewin.mp3');
  final incorrect = Sound(path: 'assets/sounds/saeloose.mp3');

  late TextToSpeech tts;
  List<String> languages = <String>[];
  late String language;
  String get languagecode {
    return language.split('-').first;
  }

  List<String>? voices;

  String _lastSpokenWords = '';
  String get lastSpokenWords => _lastSpokenWords;
  set lastSpokenWords(String value) {
    _lastSpokenWords = value;
    notifyListeners();
  }

  void initSound() {
    ByteData bytes;
    soundpool = Soundpool.fromOptions(options: const SoundpoolOptions());
    scheduleMicrotask(() async {
      bytes = await rootBundle.load(owoumbaoue.path);
      owoumbaoue.id = await soundpool.load(bytes);
      bytes = await rootBundle.load(correct.path);
      correct.id = await soundpool.load(bytes);
      bytes = await rootBundle.load(incorrect.path);
      incorrect.id = await soundpool.load(bytes);
    });
  }

  Future initTts() async {
    tts = TextToSpeech();
    _getLanguages();
  }

  Future _getLanguages() async {
    languages = await tts.getLanguages();
    voices = await tts.getVoiceByLang(language);
  }

  void setLanguage(String lang) async {
    language = lang;
    tts.setLanguage(language);
    await initTts();
    notifyListeners();
  }

  Future speak(String speakText, {double rate = 0.9}) async {
    var correctedText = speakText;
    if (correctedText.isNotEmpty) {
      if (language == 'fr-FR') correctedText = correctedText.replaceAll('î', 'i').replaceAll('ê', 'è');
    }
    tts.setRate(rate);
    if (correctedText.isNotEmpty) {
      tts.speak(correctedText);
    }
  }

  Future speaktext(String speaktext) async {
    if (speaktext.isNotEmpty) {
      await speak(speaktext);
    }
  }
}
