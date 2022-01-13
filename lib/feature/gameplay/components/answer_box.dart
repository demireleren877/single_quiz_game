import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/components/centered_progress.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:game/feature/gameplay/viewmodel/game_viewmodel.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    Key? key,
    required this.gameVM,
    required this.order,
    required this.correctness,
  }) : super(key: key);

  final GameVM gameVM;
  final int order;
  final bool? correctness;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.08),
      width: context.dynamicWidth(0.9),
      child: Observer(
        builder: (a) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          color: gameVM.answerCorrectness[order] == null
              ? Colors.white
              : gameVM.answerCorrectness[order] == true
                  ? Colors.green
                  : Colors.red,
          shadowColor: AppColors.grey,
          child: Observer(
            builder: (context) => gameVM.jsonResponse != null
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Text(
                        gameVM.replaceSpecials(gameVM.answers[order]),
                        style: context.textTheme.headline6
                            ?.copyWith(fontSize: 23.sp, color: AppColors.black),
                      ),
                    ),
                  )
                : const CenteredProgress(),
          ),
        ),
      ),
    );
  }
}
