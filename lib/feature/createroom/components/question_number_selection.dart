import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/feature/createroom/components/selectable_button.dart';
import 'package:game/feature/createroom/viewmodel/create_viewmodel.dart';
import 'package:kartal/kartal.dart';

class QuestionNumberSelection extends StatelessWidget {
  const QuestionNumberSelection({
    Key? key,
    required this.createVM,
  }) : super(key: key);
  final CreateVM createVM;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: context.paddingNormal,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Observer(
            builder: (c) => SelectableButton(
              factor: 5,
              collecter: 1,
              selectKind: createVM.selectedQuestIndex,
              onTap: () {
                createVM.selectedQuestIndex = index;
              },
              index: index,
            ),
          );
        },
      ),
    );
  }
}
