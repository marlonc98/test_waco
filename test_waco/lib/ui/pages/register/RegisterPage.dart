import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_waco/domain/blocs/localizations/AppLocalizations.dart';
import 'package:test_waco/domain/blocs/user/UserProvider.dart';
import 'package:test_waco/ui/pages/login/LoginPage.dart';
import 'package:test_waco/ui/utils/TextStyles.dart';
import 'package:test_waco/ui/utils/Validators.dart';
import 'package:test_waco/ui/widgets/CustomButton.dart';
import 'package:test_waco/ui/widgets/CustomLayout.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> values = {};
  late AppLocalizations localization;

  register() async {
    if (_formKey.currentState!.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      /*dynamic user = await userProvider.login(values);
      if (user == null) {
        //error
        setState(() {
          activeForm = true;
        });
        ShowModal.showSnackBar(
            context: context,
            error: true,
            text: localization.translate(
                keyText: KeyWordsLocalization.loginWrongCredentials));
      } else {
        //done
        if (user.firstLogin)
          Navigator.of(context).popAndPushNamed(NewPassword.route);
        else
          Navigator.of(context).popAndPushNamed(PinCreationPage.route);
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        body: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/logo.svg',
                          height: 60, alignment: Alignment.centerLeft),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        'UNETENOS A WACO',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = highLightText()),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico',
                          ),
                          validator: (value) => Validators.check(
                              isEmail: true,
                              text: value,
                              fields: values,
                              key: 'email',
                              context: context),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                          ),
                          obscureText: true,
                          validator: (value) => Validators.check(
                              minLength: 6,
                              text: value,
                              fields: values,
                              key: 'password',
                              context: context),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Repetir contraseña',
                          ),
                          obscureText: true,
                          validator: (value) => Validators.check(
                              minLength: 6,
                              text: value,
                              fields: values,
                              matchFieldKey: 'password',
                              matchFieldName: 'contraseña',
                              key: 'password_confirm',
                              context: context),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          onTap: register,
                          text: 'Registrarte',
                          type: TypeCustomButton.filled,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.popAndPushNamed(context, LoginPage.route);
                  },
                  text: 'Ya tengo una cuenta',
                  type: TypeCustomButton.normal,
                )
              ],
            )));
  }
}
