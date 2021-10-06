
import 'package:test_waco/domain/blocs/localizations/AppLocalizations.dart';
import 'package:test_waco/domain/blocs/localizations/KeyWordsLocalization.dart';

class Validators {
  static String? checkEmail(
      {required dynamic text,
      required Map<String, dynamic> fields,
      required String key,
      required context}) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (!emailValid) {
      final localization = AppLocalizations.of(context);
      return localization.translate(
          keyText: KeyWordsLocalization.validatorEmail);
    }
    fields[key] = text;
    return null;
  }

  static String? checkMinlength(
      {required String text,
      required Map<String, dynamic> fields,
      required minLength,
      required String key,
      required context}) {
    if (text.length < minLength) {
      final localization = AppLocalizations.of(context);
      return localization.translate(
          keyText: KeyWordsLocalization.validatorMinlength,
          values: {'minLength': 6});
    }
    fields[key] = text;
    return null;
  }

  static String? checkMatchWithField(
      {required String text,
      required Map<String, dynamic> fields,
      required String fieldName,
      required String fieldKey,
      required String key,
      required context}) {
    if (text != fields[fieldKey]) {
      final localization = AppLocalizations.of(context);
      return localization.translate(
          keyText: KeyWordsLocalization.validatorMatchField,
          values: {'fieldName': fieldName});
    }
    fields[key] = text;
    return null;
  }

  static String? check(
      {bool isEmail: false,
      int? minLength,
      int? maxLength,
      int? minValue,
      int? maxValue,
      String? matchFieldName,
      String? matchFieldKey,
      required dynamic text,
      required Map<String, dynamic> fields,
      required String key,
      required context}) {
    if (isEmail) {
      String? check = Validators.checkEmail(
          text: text, fields: fields, key: key, context: context);
      if (check != null) return check;
    }
    if (minLength != null) {
      String? check = Validators.checkMinlength(
          text: text, fields: fields, key: key, context: context, minLength: 6);
      if (check != null) return check;
    }
    if (matchFieldKey != null) {
      String? check = Validators.checkMatchWithField(
          text: text,
          fields: fields,
          key: key,
          context: context,
          fieldKey: matchFieldKey,
          fieldName: matchFieldName!);
      if (check != null) return check;
    }
    return null;
  }
}
