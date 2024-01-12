import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future awesomeDialog(
    String title, String desc, BuildContext context, DialogType dialogType,
    {void Function()? btnCancelOnPress,
    void Function()? btnOkOnPress,
    bool dismissOnTouchOutside = true}) {
  return AwesomeDialog(
    btnOkText: 'Yes',
    btnCancelText: 'Cancel',
    dismissOnTouchOutside: dismissOnTouchOutside,
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  ).show();
}
