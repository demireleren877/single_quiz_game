import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/feature/gameplay/constants.dart';
import 'package:kartal/kartal.dart';
import 'components/answer_box.dart';
import 'components/question_box.dart';
import 'components/timer_widget.dart';
import 'viewmodel/game_viewmodel.dart';

class GameScreen extends StatefulWidget {
  final int? second;
  final int? quest;

  const GameScreen({Key? key, this.second, this.quest}) : super(key: key);
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with WidgetsBindingObserver {
  final GameVM _gameVM = GameVM();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _gameVM.audioPlayer.resume();
    } else {
      _gameVM.audioPlayer.pause();
    }
  }

  @override
  void initState() {
    super.initState();
    _gameVM
        .getQuestions(widget.quest)
        .then((value) => _gameVM.timer(widget.second, context, widget.quest));
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await _gameVM.audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(GamePlayConstants.bgPath), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 30.h),
            TimerWidget(gameVM: _gameVM),
            SizedBox(height: 20.h),
            QuestionBox(gameVM: _gameVM),
            SizedBox(height: 30.h),
            SizedBox(
              height: 400.h,
              child: ListView.builder(
                padding: context.paddingLow,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: context.paddingLow,
                    child: GestureDetector(
                      onTap: () {
                        _gameVM.checkAnswer(index);
                      },
                      child: Observer(
                        builder: (a) => AnswerBox(
                          gameVM: _gameVM,
                          order: index,
                          correctness: _gameVM.answerCorrectness[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
