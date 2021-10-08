import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_waco/domain/blocs/drawer/DrawerProvider.dart';
import 'package:test_waco/domain/blocs/user/UserProvider.dart';
import 'package:test_waco/ui/pages/home/HomePage.dart';
import 'package:test_waco/ui/pages/login/LoginPage.dart';
import 'package:test_waco/ui/pages/posts/PostPage.dart';
import 'package:test_waco/ui/widgets/CustomButton.dart';

class CustomLayout extends StatefulWidget {
  final Widget? bottomNavigationBar;
  static const route = '/CustomLayout';
  final Widget body;
  CustomLayout({Key? key, required this.body, this.bottomNavigationBar});
  _CustomLayoutState createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  late DrawerProvider drawerProvider;
  double top = 0.0;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        top = _scrollController.offset;
      });
    });
  }

  void _navigate(String route) {
    Navigator.popAndPushNamed(context, route);
    drawerProvider.toggleOpen();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    drawerProvider = Provider.of<DrawerProvider>(context);
    return Stack(
      children: [
        Image.asset(
          "assets/bg_main.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: top < 20
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.5),
                title: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo_horizontal.png',
                          height: 50,
                          alignment: Alignment.bottomLeft,
                        ),
                        InkWell(
                            onTap: () => drawerProvider.toggleOpen(),
                            child: SvgPicture.asset('assets/menu.svg'))
                      ],
                    )),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: widget.body,
            bottomNavigationBar: widget.bottomNavigationBar),
        Material(
          color: Colors.black.withOpacity(0.8),
          child: InkWell(
            onTap: () => drawerProvider.toggleOpen(),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: drawerProvider.open ? 1 : 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: drawerProvider.open
                    ? MediaQuery.of(context).size.height
                    : 0,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7)),
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 20, left: 10.0, right: 10.0),
                              margin: EdgeInsets.only(top: kToolbarHeight - 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/logo_horizontal.png',
                                    height: 50,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                  InkWell(
                                      onTap: () => drawerProvider.toggleOpen(),
                                      child:
                                          SvgPicture.asset('assets/close.svg'))
                                ],
                              )),
                          SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                            onTap: () => _navigate(HomePage.route),
                            text: 'INICIO',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomButton(
                            onTap: () => _navigate(HomePage.route),
                            text: 'BENEFICIOS',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomButton(
                            onTap: () => _navigate(PostPage.route),
                            text: 'NOTICIAS',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          userProvider.user != null
                              ? CustomButton(
                                  onTap: () {
                                    userProvider.logout();
                                    drawerProvider.toggleOpen();
                                  },
                                  text: 'LOGOUT',
                                  type: TypeCustomButton.outline,
                                )
                              : CustomButton(
                                  onTap: () => _navigate(LoginPage.route),
                                  text: 'LOGIN',
                                  type: TypeCustomButton.outline,
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
