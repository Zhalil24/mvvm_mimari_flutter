import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

mixin ServiceHelper {
  void showMessage(
      GlobalKey<ScaffoldState> scaffoldKey, IErrorModel errorModel) {
    if (scaffoldKey == null || errorModel == null) return;

    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
        content:
            Text(errorModel.description ?? errorModel.statusCode.toString())));
  }
}
