import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class WizardTextField extends StatelessWidget {
  String? labelText;
  Widget field;

  WizardTextField({Key? key, this.labelText, required this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelText ?? '',
          style: GoogleFonts.jost(
              fontWeight: FontWeight.w400,
              color: const Color(0xff4E4E4E),
              fontSize: 14,
              fontStyle: FontStyle.normal),
        ),
        field
      ],
    );
  }
}
