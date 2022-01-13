import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/feature/createroom/components/selectable_button.dart';
import 'package:game/feature/createroom/viewmodel/create_viewmodel.dart';
import 'package:kartal/kartal.dart';

class TimeSelection extends StatelessWidget {
  const TimeSelection({
    Key? key,
    required this.createVM,
  }) : super(key: key);
  final CreateVM createVM;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Observer(
            builder: (c) => SelectableButton(
              factor: 5,
              collecter: 4,
              selectKind: createVM.selectedTimeIndex,
              onTap: () {
                createVM.selectedTimeIndex = index;
              },
              index: index,
            ),
          );
        },
      ),
    );
  }
}
