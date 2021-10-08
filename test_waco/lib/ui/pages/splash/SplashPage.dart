import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_waco/domain/blocs/localizations/AppLocalizations.dart';
import 'package:test_waco/domain/blocs/localizations/KeyWordsLocalization.dart';
import 'package:test_waco/domain/blocs/user/UserProvider.dart';
import 'package:test_waco/ui/pages/home/HomePage.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      nextStep();
    });
  }

  nextStep() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.get();
    Navigator.popAndPushNamed(context, HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 32, top: 16),
          child: Text(localization.translate(
              keyText: KeyWordsLocalization.developedBy)),
        )
      ],
    ));
  }
}
