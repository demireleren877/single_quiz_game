import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:game/core/constants/api_constants.dart';
import 'package:game/core/constants/hive_constants.dart';
import 'package:game/core/constants/special_characters.dart';
import 'package:game/core/models/question_model.dart';
import 'package:game/core/services/firebase_services.dart';
import 'package:game/feature/gameplay/constants.dart';
import 'package:game/feature/results/result_screen.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'game_viewmodel.g.dart';

class GameVM = _GameVMBase with _$GameVM;

abstract class _GameVMBase with Store {
  AudioPlayer audioPlayer = AudioPlayer();
  final FirebaseServices _firebaseServices = FirebaseServices();

  @observable
  Question? jsonResponse;

  @observable
  bool isClicked = false;

  @observable
  double score = 0;

  @observable
  var answers = [];

  @observable
  int i = 0;

  @observable
  double initial = 1.0;

  @observable
  List<bool?> answerCorrectness = [null, null, null, null];

  @observable
  // ignore: prefer_typing_uninitialized_variables
  var renk;

  @action
  String replaceSpecials(text) {
    return SpecialCharacters.map.entries.fold(
      text,
      (previousValue, element) =>
          previousValue.replaceAll(element.key, element.value),
    );
  }

  @action
  Future getQuestions(quest) async {
    var response = await http.get(
        Uri.parse(ApiConstants.baseUrl + "amount=$quest" + ApiConstants.type));
    if (response.statusCode == 200) {
      jsonResponse = Question.fromJson(jsonDecode(response.body));
      getAnswers();
    }
  }

  @action
  void getAnswers() {
    answers.clear();
    answers = jsonResponse?.results[i].incorrectAnswers ?? [];
    answers.add(jsonResponse?.results[i].correctAnswer);
    answers.shuffle();
    answers.add(jsonResponse?.results[i].question);
    answers.add(jsonResponse!.results[i].correctAnswer + "1");
    playSound(GamePlayConstants.sound);
  }

  @action
  Future playSound(soundPath) async {
    AudioCache player =
        AudioCache(prefix: GamePlayConstants.prefix, fixedPlayer: audioPlayer);
    player.play(soundPath);
  }

  @action
  void checkAnswer(index) {
    isClicked = !isClicked;
    answerCorrectness = [null, null, null, null];
    audioPlayer.stop();
    if (answers[index] + "1" == answers[5]) {
      answerCorrectness[index] = true;
      playSound(GamePlayConstants.trueSound);
      score += 15;
    } else {
      playSound(GamePlayConstants.wrongSound);
      answerCorrectness[index] = false;
      for (int i = 0; i < 4; i++) {
        answers[i] + "1" == answers[5] ? answerCorrectness[i] = true : null;
      }
    }
    Future.delayed(const Duration(seconds: 2), () {
      isClicked = false;
      initial = 0.00005;
    });
  }

  @action
  void timer(int? second, context, questionNumber) {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      initial -= 1 / (second! * 100);
      initial > 0.66
          ? renk = Colors.green
          : (initial < 0.66 && initial > 0.33
              ? renk = Colors.yellow
              : renk = Colors.red);
      if (initial < 0.001) {
        i++;
        if (i < questionNumber) {
          getAnswers();
        } else {
          _firebaseServices.users
              .doc(Hive.box(HiveConstants.boxName).getAt(0))
              .set({"score": score});
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const ResultScreen(),
            ),
          );
          timer.cancel();
        }
        answerCorrectness = [null, null, null, null];
        initial = 1.0;
      }
    });
  }
}
