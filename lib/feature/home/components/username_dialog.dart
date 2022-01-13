import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:game/core/services/firebase_services.dart';
import 'package:game/feature/home/constants.dart';
import 'package:game/feature/home/viewmodel/home_viewmodel.dart';
import 'package:kartal/kartal.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'username_field.dart';

final HomeVM _homeVM = HomeVM();
final FirebaseServices _firebaseServices = FirebaseServices();
final GlobalKey<FormState> _formKey = GlobalKey();

// ignore: non_constant_identifier_names
Future<dynamic> UsernameDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (a) {
      return Dialog(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Container(
            padding: context.paddingNormal,
            height: 260.h,
            width: 300.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  HomeConstants.enterUsernameText,
                  style: context.textTheme.headline6?.copyWith(fontSize: 23.sp),
                ),
                SizedBox(height: 20.h),
                UsernameField(homeVM: _homeVM),
                SizedBox(height: 25.h),
                const ConfirmButton(),
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      );
    },
  );
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 120.w,
      child: ElevatedButton(
        onPressed: () async {
          final valid = await _firebaseServices.usernameCheck(_homeVM.userName);
          if (!valid) {
            Fluttertoast.showToast(
              msg: HomeConstants.nonuniqueUserError,
            );
          } else if (_formKey.currentState?.validate() ?? false) {
            _homeVM.addUserName(context);
          }
        },
        child: Text(
          "Confirm",
          style: context.textTheme.headline6
              ?.copyWith(fontSize: 23.sp, color: AppColors.white),
        ),
      ),
    );
  }
}
