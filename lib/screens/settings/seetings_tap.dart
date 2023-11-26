import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/theming.dart';

class SettingsTap extends StatelessWidget {
  RxBool isDark = false.obs;
  RxBool istranslated = false.obs;
  RxBool isSignOut = false.obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(30),
              horizontal: ScreenUtil().setWidth(15),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? bgColordark.withOpacity(0.5) : lightColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 4,
                )
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [

                buildLanguageSelection(context),

                // ... existing ListTiles
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildLanguageSelection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        istranslated.value = !istranslated.value;
        if (istranslated.value) {
          Get.updateLocale(Locale("ar"));
        } else {
          Get.updateLocale(Locale("en"));
        }
      },
      child: ListTile(
        title: Text(
          "7".tr,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: primaryColor),
        ),
        trailing: Icon(
          Icons.language_outlined,
          color: primaryColor,
        ),
      ),
    );
  }
}
