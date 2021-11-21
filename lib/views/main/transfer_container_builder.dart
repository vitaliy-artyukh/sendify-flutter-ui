import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/bloc/statefull_builder.dart';
import 'package:sendify/bloc/transfer_bloc.dart';
import 'package:sendify/models/currency.dart';
import 'package:sendify/styles/app_style.dart';
import 'package:sendify/styles/resources.dart';

Widget transferContainerBuilder(BuildContext context) {
  var transferBloc = TransferBloc();

  return StatefulBuilderExt(
    builder: (context, _) {
      var secondaryTextStyle = GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          color: secondaryTextColor);

      var mainTextStyle = GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
          fontStyle: FontStyle.normal);

      return FormBlocListener<TransferBloc, String, String>(
        formBloc: transferBloc,
        onSubmitting: (context, state) {},
        onSuccess: (context, state) {},
        onFailure: (context, state) {},
        child: Align(
          alignment: ResponsiveValue(
            context,
            defaultValue: Alignment.centerRight,
            valueWhen: const [
              Condition.smallerThan(
                name: DESKTOP,
                value: Alignment.topLeft,
              ),
            ],
          ).value!,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      ResponsiveValue(context,
                          defaultValue: 0.toDouble(),
                          valueWhen: [
                            const Condition.smallerThan(
                                name: DESKTOP, value: 12)
                          ]).value!,
                      0,
                      0),
                  child: Text(
                    tr('youSend'),
                    style: mainTextStyle.copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Stack(
                    children: [
                      TextField(
                        inputFormatters: [transferBloc.sendCurrencyFormatter],
                        keyboardType: TextInputType.number,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 44,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<Currency>(
                                underline: const SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                                iconEnabledColor: Colors.black,
                                icon: const Icon(Icons.expand_more),
                                focusColor: Colors.blueAccent,
                                value: Resources.instance.currencies[0],
                                items: Resources.instance.currencies
                                    .map((e) => DropdownMenuItem<Currency>(
                                          child: Text(e.code),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  print(value!.code);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    tr('transferFee'),
                    style: secondaryTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '8.64\$',
                        style: mainTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          tr('for'),
                          style: secondaryTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: MaterialButton(
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {},
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 106, maxHeight: 26),
                            child: Row(
                              children: [
                                const Spacer(),
                                Text(
                                  tr('fastTransfer'),
                                  style: secondaryTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    tr('exchangeRate'),
                    style: secondaryTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Text(
                    '8.64\$',
                    style: mainTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    tr('recipientWillGet'),
                    style: mainTextStyle.copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Stack(
                    children: [
                      TextField(
                        inputFormatters: [transferBloc.sendCurrencyFormatter],
                        keyboardType: TextInputType.number,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 44,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<Currency>(
                                underline: const SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                                iconEnabledColor: Colors.black,
                                icon: const Icon(Icons.expand_more),
                                focusColor: Colors.blueAccent,
                                value: Resources.instance.currencies[0],
                                items: Resources.instance.currencies
                                    .map((e) => DropdownMenuItem<Currency>(
                                          child: Text(e.code),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  print(value!.code);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Align(
                    alignment: ResponsiveValue(
                      context,
                      defaultValue: Alignment.centerRight,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: DESKTOP,
                          value: Alignment.center,
                        ),
                      ],
                    ).value!,
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {},
                      child: Container(
                        constraints:
                            const BoxConstraints(maxWidth: 225, minHeight: 48),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              tr('transferNow'),
                              style: secondaryTextStyle.copyWith(
                                  color: Colors.white, fontSize: 18),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right_rounded,
                              size: 32,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    dispose: () {
      transferBloc.dispose();
    },
  );
}
