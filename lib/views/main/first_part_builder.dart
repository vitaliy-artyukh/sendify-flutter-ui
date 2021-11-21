import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/styles/app_style.dart';
import 'package:sendify/views/main/transfer_container_builder.dart';

Widget firstPartBuilder(BuildContext context) {
  return ResponsiveRowColumn(
    layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
        ? ResponsiveRowColumnType.COLUMN
        : ResponsiveRowColumnType.ROW,
    rowCrossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //first column, info
      ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('mainBannerLabel'),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    height: 1.04,
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 64.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: TABLET,
                          value: 32.0,
                        ),
                      ],
                    ).value,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
              ResponsiveVisibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(
                    tr('subBannerLabel'),
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                hiddenWhen: const [
                  Condition.smallerThan(name: TABLET),
                ],
              ),
              ResponsiveVisibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(
                    tr('secRegulatedService'),
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                hiddenWhen: const [
                  Condition.smallerThan(name: TABLET),
                ],
              ),
              ResponsiveVisibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(
                    tr('learnMore'),
                    style: GoogleFonts.poppins(
                        color: secondaryTextColor,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                hiddenWhen: const [
                  Condition.smallerThan(name: TABLET),
                ],
              ),
            ],
          )),
      ResponsiveRowColumnItem(
        rowFlex: 1,
        child: transferContainerBuilder(context),
      )
    ],
  );
}
