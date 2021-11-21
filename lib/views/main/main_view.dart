import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/views/main/footer_view.dart';
import 'package:sendify/views/main/header_builder.dart';
import 'package:sendify/views/main/second_part_builder.dart';
import 'package:sendify/views/main/selling_points_builder.dart';

import 'first_part_builder.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    var menuItemStyle = GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 20,
        fontStyle: FontStyle.normal);

    var horizontalPadding = ResponsiveValue(context,
            defaultValue: 86.toDouble(),
            valueWhen: [const Condition.smallerThan(name: TABLET, value: 20)])
        .value!;

    return SafeArea(
      child: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    horizontalPadding, 30, horizontalPadding, 0),
                child: mainHeaderBuilder(menuItemStyle, context),
              ),
              ResponsiveVisibility(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      horizontalPadding, 0, horizontalPadding, 0),
                  child: const Divider(
                    thickness: 2,
                    color: Color(0xff9F9F9F),
                  ),
                ),
                hiddenWhen: const [Condition.smallerThan(name: TABLET)],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    horizontalPadding, 32, horizontalPadding, 0),
                child: firstPartBuilder(context),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    horizontalPadding, 32, horizontalPadding, 0),
                child: sellingPointsBuilder(context),
              ),
              secondPartBuilder(context),
              FooterView()
            ],
          ),
        ),
      ),
    );
  }
}
