import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sendify/bloc/wizard/deposit_methods_cubit.dart';
import 'package:sendify/bloc/wizard/wizard_form_bloc.dart';
import 'package:sendify/models/deposit_method.dart';
import 'package:sendify/styles/app_style.dart';

// ignore: non_constant_identifier_names
FormBlocStep DepositFundsStep(WizardFormBloc wizardFormBloc) {
  return FormBlocStep(
    title: Text(
      tr('depositFunds'),
      style: wizardHederStepHederStyle,
    ),
    content: Container(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('selectDepositMethod'),
            textAlign: TextAlign.start,
            style: wizardStepHederStyle,
          ),
          Text(
            tr('selectDepositMethodFull'),
            textAlign: TextAlign.start,
            style: wizardInfoTitleStyle,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: BlocBuilder<DepositMethodCubit, DepositMethod?>(
              bloc: wizardFormBloc.depositMethodsCubit,
              builder: (context, state) {
                return ResponsiveRowColumn(
                  layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  columnSpacing: 12,
                  rowSpacing: 12,
                  children: [
                    for (var item in wizardFormBloc.depositMethodsCubit.methods)
                      ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: SizedBox(
                            width: 105,
                            height: 105,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: containerBackgroundColor,
                                  elevation: item.id == state?.id ? 8 : 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              onPressed: () {
                                wizardFormBloc.depositMethodsCubit
                                    .updateMethod(item);
                              },
                              child: Text(
                                tr(item.titleKey),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ))
                  ],
                );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Container(
                height: 180,
                width: double.infinity,
                child: const Text('Text'),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xffD0D0D0),
                    borderRadius: BorderRadius.circular(10)),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Text(
                tr('afterFinalizingTheDepositLabel'),
                textAlign: TextAlign.start,
                style: wizardInfoTitleStyle,
              )),
        ],
      ),
    ),
  );
}
