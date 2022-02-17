import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiliaro_test_album/core/common/constants/size_constants.dart';

class AppThemeText {
  AppThemeText._();
  static TextTheme get _roboto => GoogleFonts.robotoTextTheme();
  static TextStyle get _headline6 => _roboto.headline6!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get _headline5 =>
      _roboto.headline5!.copyWith(color: Colors.grey);
  static TextStyle get _body =>
      _roboto.bodyText1!.copyWith(color: Colors.black);
  static TextStyle get _caption => _roboto.caption!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: Sizes.dimen_16,
          shadows: [
            const Shadow(
                color: Colors.black45,
                blurRadius: Sizes.dimen_8,
                offset: Offset(Sizes.dimen_1, Sizes.dimen_1))
          ]);
  static getTextTheme() => TextTheme(
        headline5: _headline5,
        headline6: _headline6,
        bodyText1: _body,
        caption: _caption,
      );
}
