import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:game/feature/createroom/viewmodel/create_viewmodel.dart';
import 'package:kartal/kartal.dart';
import 'components/create_game_button.dart';
import 'components/question_number_selection.dart';
import 'components/time_selection.dart';
import 'constants.dart';

final CreateVM _createVM = CreateVM();

// ignore: non_constant_identifier_names
Future<dynamic> GameSettingsSheet(BuildContext context) {
  return showModalBottomSheet(
    isDismissible: true,
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.r),
        topRight: Radius.circular(15.r),
      ),
    ),
    context: context,
    builder: (a) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            CreateRoomConstants.title1,
            style: context.textTheme.headline6?.copyWith(fontSize: 23.sp),
          ),
          TimeSelection(createVM: _createVM),
          SizedBox(height: 25.h),
          Text(
            CreateRoomConstants.title2,
            style: context.textTheme.headline6?.copyWith(fontSize: 23.sp),
          ),
          QuestionNumberSelection(createVM: _createVM),
          SizedBox(height: 25.h),
          CreateGameButton(createVM: _createVM),
        ],
      );
    },
  );
}
