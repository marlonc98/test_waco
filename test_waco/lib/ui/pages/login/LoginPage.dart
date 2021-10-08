import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_waco/domain/blocs/user/UserProvider.dart';
import 'package:test_waco/ui/pages/home/HomePage.dart';
import 'package:test_waco/ui/pages/register/RegisterPage.dart';
import 'package:test_waco/ui/utils/ShowModal.dart';
import 'package:test_waco/ui/utils/TextStyles.dart';
import 'package:test_waco/ui/utils/Validators.dart';
import 'package:test_waco/ui/widgets/CustomButton.dart';
import 'package:test_waco/ui/widgets/CustomLayout.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool active = true;
  Map<String, dynamic> values = {};

  login() async {
    if (_formKey.currentState!.validate() && active) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      User? user =
          await userProvider.login(values['email'], values['password']);
      if (user == null) {
        //error
        ShowModal.showSnackBar(
            context: context, error: true, text: 'Credenciales erradas');
        active = false;
      } else {
        //done
        Navigator.of(context).popAndPushNamed(HomePage.route);
      }
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
                        'BIENVENIDO A WACO',
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
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          onTap: login,
                          text: 'Iniciar sesi[on',
                          type: TypeCustomButton.filled,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.popAndPushNamed(context, RegisterPage.route);
                  },
                  text: 'Registrarse',
                  type: TypeCustomButton.normal,
                )
              ],
            )));
  }
}
