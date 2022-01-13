import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class SelectableButton extends StatelessWidget {
  const SelectableButton(
      {Key? key,
      required this.factor,
      required this.collecter,
      this.selectKind,
      required this.onTap,
      required this.index})
      : super(key: key);

  final int? selectKind;
  final int factor;
  final int collecter;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColors.white),
          color: selectKind == index
              ? AppColors.btnColor
              : AppColors.purpleShade300,
        ),
        width: 75.w,
        height: 75.h,
        child: Center(
            child: Text(
          ((index + collecter) * factor).toString(),
          style: context.textTheme.headline6
              ?.copyWith(fontSize: 23.sp, color: AppColors.white),
        )),
      ),
    );
  }
}
