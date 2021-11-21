import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class FooterView extends StatelessWidget {
  late List<Widget> _firstColumn;
  late List<Widget> _secondColumn;

  var hederStyle = GoogleFonts.poppins().copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: const Color(0x99ffffff));

  var menuItemStyle = GoogleFonts.poppins().copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: const Color(0xffffffff));

  FooterView({Key? key}) : super(key: key) {
    _firstColumn = List.empty(growable: true);
    _secondColumn = List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    _prepareColumns(context);

    return Container(
      color: const Color(0xffAEAEAE),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: _firstColumn,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Column(
                children: _secondColumn,
                crossAxisAlignment: CrossAxisAlignment.start)
          ],
        ),
      ),
    );
  }

  void _prepareColumns(BuildContext context) {
    _firstColumn.add(Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Text(
        tr('Account').toUpperCase(),
        style: hederStyle,
      ),
    ));
    _prepareItemsForHeader(_firstColumn, {
      tr('signIn'): () {},
      tr('register'): () {},
    });

    _firstColumn.add(Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Text(
        tr('About').toUpperCase(),
        style: hederStyle,
      ),
    ));
    _prepareItemsForHeader(_firstColumn, {
      tr('contact'): () {},
      tr('media'): () {},
    });

    _firstColumn.add(Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Text(
        '© 2021 Bytelogics Inc. All rights reserved'.replaceAll('. ',
            ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? '.\n' : '. '),
        style: hederStyle,
      ),
    ));

    _secondColumn.add(Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Text(
        tr('Legal').toUpperCase(),
        style: hederStyle,
      ),
    ));
    _prepareItemsForHeader(_secondColumn, {
      tr('termsOfUse'): () {},
      tr('privacyPolicy'): () {},
    });
  }

  void _prepareItemsForHeader(
      List<Widget> columnItems, Map<String, Function()> items) {
    for (var item in items.entries) {
      columnItems.add(OutlinedButton(
        onPressed: item.value,
        child: Text(
          item.key,
          style: menuItemStyle,
        ),
        style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 0.0, color: Colors.transparent),
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(0, 0)),
      ));
    }
  }
}
