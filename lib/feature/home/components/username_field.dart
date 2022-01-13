import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/feature/home/viewmodel/home_viewmodel.dart';
import 'package:kartal/kartal.dart';
import '../constants.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key? key,
    required this.homeVM,
  }) : super(key: key);

  final HomeVM homeVM;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.length < 4 || value.isEmpty) {
          return HomeConstants.tooShortError;
        } else if (value.length > 10) {
          return HomeConstants.tooLongError;
        }
      },
      onChanged: (value) => homeVM.onChanged(value),
      style: context.textTheme.headline6?.copyWith(fontSize: 20.sp),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
