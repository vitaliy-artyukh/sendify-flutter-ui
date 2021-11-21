// ignore: implementation_imports
import 'package:easy_localization/easy_localization.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/styles/app_style.dart';
import 'package:sendify/styles/resources.dart';
import 'package:sendify/views/main/main_view.dart';
import 'package:sendify/views/wizard/wizard_form.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Resources.instance.load();

    var baseTheme = Theme.of(context);

    var textTheme = baseTheme.textTheme;

    var themeData = TextTheme(
      headline1: GoogleFonts.jost(textStyle: textTheme.headline1),
      headline2: GoogleFonts.jost(textStyle: textTheme.headline2),
      headline3: GoogleFonts.jost(textStyle: textTheme.headline3),
      headline4: GoogleFonts.jost(textStyle: textTheme.headline4),
      headline5: GoogleFonts.jost(textStyle: textTheme.headline5),
      headline6: GoogleFonts.jost(textStyle: textTheme.headline6),
      subtitle1: GoogleFonts.jost(textStyle: textTheme.subtitle1)
          .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
      subtitle2: GoogleFonts.jost(textStyle: textTheme.subtitle2),
      bodyText1: GoogleFonts.jost(textStyle: textTheme.bodyText1),
      bodyText2: GoogleFonts.jost(textStyle: textTheme.bodyText2),
      caption: GoogleFonts.jost(textStyle: textTheme.caption),
      button: GoogleFonts.jost(textStyle: textTheme.button),
      overline: GoogleFonts.jost(textStyle: textTheme.overline),
    );

    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(
            color: backgroundColor,
          )),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Sendify',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryTextTheme: themeData,
        textTheme: themeData,
        backgroundColor: backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            constraints: const BoxConstraints(maxHeight: 48),
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0)),
      ),
      routes: {
        '/': (context) => const MainView(),
        '/transferDetails': (context) => WizardForm(),
      },
      initialRoute: '/',
    );
  }
}
