import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/styles/app_style.dart';
import 'package:sendify/views/main/selling_point.dart';

Widget sellingPointsBuilder(BuildContext context) {
  return ResponsiveRowColumn(
    rowMainAxisAlignment: MainAxisAlignment.center,
    columnCrossAxisAlignment: CrossAxisAlignment.stretch,
    rowPadding: const EdgeInsets.all(30),
    columnPadding: const EdgeInsets.all(30),
    layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
        ? ResponsiveRowColumnType.COLUMN
        : ResponsiveRowColumnType.ROW,
    children: [
      ResponsiveRowColumnItem(
        rowFlex: 1,
        child: SellingPoint(
          title: tr('trustedByOurCustomers'),
          iconName: 'dollar_sign',
          description: [
            TextSpan(text: tr('trustedByOurCustomersSubLabelFirstPart')),
            TextSpan(
                text: "\$3,500,000+",
                style: GoogleFonts.poppins(
                    color: wizardButtonColor,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14)),
            TextSpan(text: tr('trustedByOurCustomersSubLabelSecondPart')),
          ],
        ),
      ),
      ResponsiveRowColumnItem(
        rowFlex: 1,
        child: SellingPoint(
          title: tr('fairPricing'),
          iconName: 'like_finger',
          description: [TextSpan(text: tr('fairPricingSubLabel'))],
        ),
      ),
      ResponsiveRowColumnItem(
        rowFlex: 1,
        child: SellingPoint(
          title: tr('safetyGuarantee'),
          iconName: 'security_mark',
          description: [TextSpan(text: tr('safetyGuaranteeSubLabel'))],
        ),
      ),
    ],
  );
}
