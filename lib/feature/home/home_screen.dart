import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/hive_constants.dart';
import 'package:game/feature/createroom/game_settings.dart';
import 'package:game/feature/home/constants.dart';
import 'package:hive/hive.dart';
import 'components/custom_button.dart';
import 'components/username_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(HomeConstants.logoPath),
            ),
            CustomButton(
              btnText: HomeConstants.btn1Text,
              onPress: () {
                Hive.box(HiveConstants.boxName).isNotEmpty
                    ? GameSettingsSheet(context)
                    : UsernameDialog(context);
              },
            ),
            SizedBox(height: 25.h),
            CustomButton(
              btnText: HomeConstants.btn2Text,
              onPress: () {},
            ),
            SizedBox(height: 100.h)
          ],
        ),
      ),
    );
  }
}
