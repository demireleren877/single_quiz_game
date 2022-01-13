import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

// ignore: non_constant_identifier_names
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPress,
    this.btnText,
  }) : super(key: key);

  final VoidCallback? onPress;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      width: 225.w,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          btnText ?? "",
          style: context.textTheme.headline6
              ?.copyWith(color: AppColors.white, fontSize: 28.sp),
        ),
      ),
    );
  }
}
