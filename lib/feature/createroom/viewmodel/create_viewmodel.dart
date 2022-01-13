import 'package:flutter/material.dart';
import 'package:game/core/constants/hive_constants.dart';
import 'package:game/core/services/firebase_services.dart';
import 'package:game/feature/gameplay/game_screen.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'create_viewmodel.g.dart';

class CreateVM = _CreateVMBase with _$CreateVM;

abstract class _CreateVMBase with Store {
  final FirebaseServices _firebaseServices = FirebaseServices();

  @observable
  int? selectedTimeIndex;

  @observable
  int? selectedQuestIndex;

  @action
  createGame(context) async {
    await _firebaseServices.games
        .doc(DateTime.now().microsecondsSinceEpoch.toString())
        .set({
      "time": (selectedTimeIndex ?? 0 + 4) * 5,
      "question": (selectedQuestIndex ?? 0 + 1) * 5,
      "admin": Hive.box(HiveConstants.boxName).getAt(0),
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => GameScreen(
            second: (selectedTimeIndex! + 4) * 5,
            quest: (selectedQuestIndex! + 1) * 5,
          ),
        ),
        (route) => false);
  }
}
