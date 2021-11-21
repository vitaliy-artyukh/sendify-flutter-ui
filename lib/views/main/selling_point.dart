// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sendify/styles/app_style.dart';

// ignore: must_be_immutable
class SellingPoint extends StatelessWidget {
  final String iconName;
  final String title;
  final List<TextSpan> description;

  SellingPoint(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.description})
      : super(key: key);

  var titleStyle = GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 22);

  var textStyle = GoogleFonts.poppins(
      color: secondaryTextColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset("assets/images/$iconName.svg"),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Color(0x40000000))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 4, 0),
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 4, 0),
            child: RichText(
                text: TextSpan(children: description, style: textStyle)),
          )
        ],
      ),
    );
  }
}
