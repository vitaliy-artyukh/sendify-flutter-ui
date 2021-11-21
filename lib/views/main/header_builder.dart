import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:sendify/styles/app_style.dart';

Widget mainHeaderBuilder(TextStyle menuItemStyle, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Sendify', style: headerTextStyle),
      const Spacer(),
      ResponsiveVisibility(
        visibleWhen: const [
          Condition.largerThan(name: TABLET),
        ],
        visible: false,
        child: Row(
          children: [
            TextButton(
                onPressed: () => {},
                child: Text(tr('home'), style: menuItemStyle)),
            TextButton(
                onPressed: () => {},
                child: Text(tr('sendMoney'), style: menuItemStyle)),
            TextButton(
                onPressed: () => {},
                child: Text(tr('about'), style: menuItemStyle)),
            TextButton(
                onPressed: () => {},
                child: Text(tr('faq'), style: menuItemStyle)),
            TextButton(
                onPressed: () => {},
                child: Text(tr('login'), style: menuItemStyle)),
            SizedBox(
              width: 175,
              height: 40,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  tr('signUp'),
                  style: menuItemStyle.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black.withOpacity(0.5);
                    }
                    return Colors.black; // Use the component's default.
                  },
                ), overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black.withOpacity(0.5);
                    }

                    if (states.contains(MaterialState.hovered)) {
                      return Colors.grey.withOpacity(0.5);
                    }

                    return Colors.black; // Use the component's default.
                  },
                )),
              ),
            ),
          ],
        ),
      ),
      ResponsiveVisibility(
        child: SizedBox(
          width: 48,
          height: 48,
          child: MaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  var mediaQuery = MediaQuery.of(context);

                  return MaterialButton(
                    padding: const EdgeInsets.all(0),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: mediaQuery.size.height,
                        width: 400,
                        child: Material(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () => {},
                                  child:
                                      Text(tr('home'), style: menuItemStyle)),
                              TextButton(
                                  onPressed: () => {},
                                  child: Text(tr('sendMoney'),
                                      style: menuItemStyle)),
                              TextButton(
                                  onPressed: () => {},
                                  child:
                                      Text(tr('about'), style: menuItemStyle)),
                              TextButton(
                                  onPressed: () => {},
                                  child: Text(tr('faq'), style: menuItemStyle)),
                              TextButton(
                                  onPressed: () => {},
                                  child:
                                      Text(tr('login'), style: menuItemStyle)),
                              SizedBox(
                                width: 175,
                                height: 40,
                                child: TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    tr('signUp'),
                                    style: menuItemStyle.copyWith(
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ButtonStyle(backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.black.withOpacity(0.5);
                                      }
                                      return Colors
                                          .black; // Use the component's default.
                                    },
                                  ), overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.black.withOpacity(0.5);
                                      }

                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors.grey.withOpacity(0.5);
                                      }

                                      return Colors
                                          .black; // Use the component's default.
                                    },
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        visible: false,
        visibleWhen: const [
          Condition.smallerThan(name: DESKTOP),
        ],
      )
    ],
  );
}
