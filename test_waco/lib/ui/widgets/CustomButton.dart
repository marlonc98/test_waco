import 'package:flutter/material.dart';
import 'package:test_waco/ui/utils/constants.dart';

enum TypeCustomButton { normal, outline, filled }

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final TypeCustomButton type;
  final TextStyle? style;
  CustomButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.style,
      this.type = TypeCustomButton.normal})
      : super(key: key);

  final borderFilled = BoxDecoration(
    color: Colors.black,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );

  final degradeFilled = BoxDecoration(
    gradient: LinearGradient(colors: [kMainColorDark, kMainColor]),
    border: Border.all(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.circular(32),
  );

  BoxDecoration? getFilled(){
    switch (this.type) {
      case TypeCustomButton.normal:
        return null;
      case TypeCustomButton.filled:
        return degradeFilled;
      case TypeCustomButton.outline:
        return borderFilled;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            this.text,
            textAlign: TextAlign.center,
            style: this.style,
          ),
          decoration: getFilled()
        ),
      ),
      decoration:
          this.type == TypeCustomButton.outline ? degradeFilled : null,
    );
  }
}
