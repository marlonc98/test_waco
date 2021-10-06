import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_waco/domain/blocs/localizations/AppLocalizations.dart';
import 'package:test_waco/domain/blocs/localizations/KeyWordsLocalization.dart';

class ShowModal {
  static void openDialog(
      {required context,
      String title = '',
      String text = '',
      List<Widget>? actions}) {
    final localization = AppLocalizations.of(context);
    showCupertinoDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(text),
              actions: actions ??
                  [
                    TextButton(
                        child: Text(localization.translate(
                            keyText: KeyWordsLocalization.accept)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
            ));
  }

  static void showLoading({required context}) {
    showCupertinoDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
              content: Container(
                  alignment: FractionalOffset.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(20.0),
                  child: CupertinoActivityIndicator(
                    animating: true,
                  )),
            ));
  }

  static void showSnackBar({required context, required text, bool? error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: error != null ? Colors.red : null,
          content: Text(text)),
    );
  }
}
