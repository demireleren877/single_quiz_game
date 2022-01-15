import 'package:flutter/material.dart';
import 'package:game/core/constants/hive_constants.dart';
import 'package:game/core/services/firebase_services.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeVM = _HomeVMBase with _$HomeVM;

abstract class _HomeVMBase with Store {
  @observable
  String userName = "";

  @action
  void onChanged(value) {
    userName = value;
  }

  @action
  void addUserName(context) {
    var box = Hive.box(HiveConstants.boxName);
    userName.isNotEmpty
        ? box.add(userName).then((value) => Navigator.pop(context))
        : null;
    FirebaseServices()
        .users
        .doc(Hive.box(HiveConstants.boxName).getAt(0))
        .set({"username": userName});
  }
}
