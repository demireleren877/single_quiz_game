import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/components/centered_progress.dart';
import 'package:game/feature/gameplay/viewmodel/game_viewmodel.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    Key? key,
    required GameVM gameVM,
  })  : _gameVM = gameVM,
        super(key: key);

  final GameVM _gameVM;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Observer(
        builder: (context) => Center(
          child: _gameVM.jsonResponse != null
              ? Text(
                  _gameVM.answers[4]
                      .replaceAll("&quot;", "")
                      .replaceAll("&#039;", "'")
                      .replaceAll("&uuml;", "ü")
                      .replaceAll("&eacute;", "é"),
                  style: context.textTheme.headline6?.copyWith(fontSize: 23.sp),
                )
              : const CenteredProgress(),
        ),
      ),
      height: context.dynamicHeight(0.2),
      width: context.dynamicWidth(0.9),
    );
  }
}
