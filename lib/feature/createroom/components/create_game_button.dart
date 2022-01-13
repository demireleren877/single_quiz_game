import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:game/feature/createroom/viewmodel/create_viewmodel.dart';
import 'package:kartal/kartal.dart';
import '../constants.dart';

class CreateGameButton extends StatelessWidget {
  const CreateGameButton({
    Key? key,
    required this.createVM,
  }) : super(key: key);

  final CreateVM createVM;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      height: 50.h,
      color: AppColors.green,
      onPressed: () {
        createVM.createGame(context);
      },
      child: Text(
        CreateRoomConstants.createBtnText,
        style: context.textTheme.headline6
            ?.copyWith(fontSize: 23.sp, color: AppColors.white),
      ),
    );
  }
}
