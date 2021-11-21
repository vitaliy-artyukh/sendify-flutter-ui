import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

Widget secondPartBuilder(BuildContext context) {
  return ResponsiveVisibility(
    hiddenWhen: const [
      Condition.smallerThan(name: TABLET),
    ],
    child: Padding(
      padding: const EdgeInsets.fromLTRB(86, 32, 86, 0),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          //first column, info
          ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Text(
                tr('borderlessPaymentsWithoutHiddenFees'),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    height: 1.3,
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
              )),
          //first column, info
          ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Text(
                tr('borderlessPaymentsWithoutHiddenFeesSubLabel'),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
    ),
  );
}
