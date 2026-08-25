import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  TextStyle get headlineLarge => GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: primaryText);
  TextStyle get headlineMedium => GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: primaryText);
  TextStyle get titleSmall => GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: primaryText);
  TextStyle get bodyMedium => GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: primaryText);
  TextStyle get labelMedium => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: secondaryText);
}

class LightModeTheme extends FlutterFlowTheme {
  LightModeTheme() {
    primary = const Color(0xFF4B39EF);
    secondary = const Color(0xFF39D2C0);
    tertiary = const Color(0xFFEE8B60);
    alternate = const Color(0xFFE0E3E7);
    primaryText = const Color(0xFF101213);
    secondaryText = const Color(0xFF57636C);
    primaryBackground = const Color(0xFFF1F4F8);
    secondaryBackground = const Color(0xFFFFFFFF);
    accent1 = const Color(0xFF6165F2);
    accent2 = const Color(0xFF333333);
    accent3 = const Color(0xFFCCCCCC);
    accent4 = const Color(0xFFEEEEEE);
    success = const Color(0xFF05A23F);
    warning = const Color(0xFFF57C00);
    error = const Color(0xFFFF5963);
    info = const Color(0xFF1C4494);
  }
}
