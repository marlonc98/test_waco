import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_waco/data/repositories/benefit/HomeBenefitRepository.dart';
import 'package:test_waco/domain/entities/noDb/Benefit.dart';
import 'package:test_waco/ui/pages/home/widgets/Carrousel.dart';
import 'package:test_waco/ui/utils/TextStyles.dart';
import 'package:test_waco/ui/widgets/CustomButton.dart';
import 'package:test_waco/ui/widgets/CustomLayout.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static const route = '/homePage';
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Benefit> _benefits = [];

  @override
  void initState() {
    loadBenefits();
    super.initState();
  }

  void loadBenefits() async {
    List<Benefit> response = await HomeBenefitRepository().getAll();
    setState(() {
      _benefits = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Bienvenido a tu ',
                      style: TextStyle(fontSize: 32.0, height: 1.7),
                      children: [
                    TextSpan(
                        text: 'Entrevista Tecnica ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'en'),
                  ])),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/logo_text.svg',
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x00000000),
              Color(0x00000000),
              Color(0xFF000000),
            ],
          )),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_work_for_you.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Image.asset('assets/work_for_you.png'),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Trabajamos para ',
                        style: TextStyle(
                            fontSize: 32.0, height: 1.4, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Convertir ideas ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'en '),
                          TextSpan(
                              text: 'Productos',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black),
          padding: EdgeInsets.only(top: 40),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Entre los \n',
              style: TextStyle(
                fontSize: 32.0,
                height: 1.4,
              ),
              children: [
                TextSpan(
                    text: ' beneficios ',
                    style: TextStyle(
                        background: Paint()..shader = highLightText())),
                TextSpan(
                  text: ' que \n',
                ),
                TextSpan(
                    text: 'ofrecemos \n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'se encuentran'),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(color: Colors.black),
            child: Carrousel(
              items: _benefits
                  .where((element) => _benefits.indexOf(element) % 2 == 0)
                  .toList()
                  .asMap()
                  .map((key, value) => MapEntry(
                      key,
                      Container(
                        child: Row(children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                  child: Column(
                                children: [
                                  SvgPicture.asset(_benefits[key].image),
                                  Text(
                                    _benefits[key].text,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ))),
                          Flexible(
                              flex: 1,
                              child: _benefits.length > key + 1
                                  ? Container(
                                      child: Column(
                                      children: [
                                        SvgPicture.asset(
                                            _benefits[key + 1].image),
                                        Text(
                                          _benefits[key + 1].text,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ))
                                  : Container()),
                        ]),
                      )))
                  .values
                  .toList(),
            )),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.black),
          child: Container(
            padding: EdgeInsets.only(top: 80, bottom: 80),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_home_boxs.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Gracias por \n',
                          style: TextStyle(
                            fontSize: 32.0,
                            height: 1.4,
                          ),
                          children: [
                            TextSpan(
                                text: 'completar el ejercicio\n',
                                style: TextStyle(
                                    foreground: Paint()
                                      ..shader = highLightText())),
                            TextSpan(
                                text: 'Te invitamos a ver mas información',
                                style: TextStyle(fontSize: 18, height: 2.3)),
                          ])),
                ),
                Container(
                  padding: EdgeInsets.only(left: 60, right: 60, top: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => launch("https://instagram.com"),
                          icon: SvgPicture.asset('assets/instagram.svg')),
                      Flexible(
                          child: Container(
                              margin: EdgeInsets.only(left: 16, right: 16),
                              width: MediaQuery.of(context).size.width,
                              child: CustomButton(
                                onTap: () {},
                                text: 'Conocer más',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                type: TypeCustomButton.filled,
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
