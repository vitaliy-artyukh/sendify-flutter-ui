import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sendify/bloc/wizard/verify_state_cubit.dart';
import 'package:sendify/bloc/wizard/wizard_form_bloc.dart';
import 'package:sendify/styles/app_style.dart';

// ignore: non_constant_identifier_names
FormBlocStep VerifyIdentityStep(WizardFormBloc wizardFormBloc) {
  return FormBlocStep(
    title: Text(
      tr('verifyIdentity'),
      style: wizardHederStepHederStyle,
    ),
    content: BlocBuilder<VerifyCubit, VerifyState>(
      bloc: wizardFormBloc.verifySate,
      builder: (context, state) {
        var child = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.empty(growable: true));

        if (state == VerifyState.prepare || state == VerifyState.enterCode) {
          child.children.add(Text(
            tr('verifyYouPhoneNumber'),
            textAlign: TextAlign.start,
            style: wizardStepHederStyle,
          ));

          child.children.add(Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
            child: Text(
              tr('verifyYouPhoneNumberSubTitle'),
              textAlign: TextAlign.start,
              style: wizardInfoTitleStyle,
            ),
          ));
        }

        switch (state) {
          case VerifyState.prepare:
            child.children.add(Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: containerBorderColor),
                  borderRadius: BorderRadius.circular(12),
                  color: containerBackgroundColor),
              child: Column(
                children: [
                  Text(
                    tr('pleaseConfirmThatNumber'),
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: const Color(0xff4E4E4E)),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text(
                      tr('isThisCorrectPhoneNumber'),
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: const Color(0xff4E4E4E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      wizardFormBloc.phoneNumberMaskFormatter.getMaskedText(),
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 22,
                          color: const Color(0xff4E4E4E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      constraints:
                          const BoxConstraints(maxWidth: 400, minWidth: 100),
                      child: OutlinedButton(
                        onPressed: () {
                          wizardFormBloc.verifySate.requestCode();
                        },
                        child: Text(
                          tr('yesSendSmsCode'),
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                        ),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1, color: wizardButtonColor),
                            backgroundColor: wizardButtonColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      tr('youShouldReceiveCode'),
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: const Color(0xff4E4E4E)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ));
            break;
          case VerifyState.enterCode:
            var codeInputRow = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.empty(growable: true));

            for (var i = 0; i < 4; i++) {
              codeInputRow.children.add(SizedBox(
                width: 48,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(4),
                      fillColor: const Color(0xfff2f2f2),
                      filled: true,
                      counter: const SizedBox(
                        width: 0,
                        height: 0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: containerBorderColor))),
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    wizardFormBloc.confirmCodeFieldBlocs[i].updateValue(value);
                  },
                  focusNode: wizardFormBloc.confirmCodeFocusNodes[i],
                ),
              ));

              if (i < 3) {
                codeInputRow.children.add(Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                  child: Container(
                    color: dividerColor,
                    width: 12,
                    height: 1,
                  ),
                ));
              }
            }

            child.children.add(Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: containerBorderColor),
                  borderRadius: BorderRadius.circular(12),
                  color: containerBackgroundColor),
              child: Column(
                children: [
                  Text(
                    tr('verifyYouPhoneNumberSmsCode'),
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: const Color(0xff4E4E4E)),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: codeInputRow,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      constraints:
                          const BoxConstraints(maxWidth: 400, minWidth: 100),
                      child: OutlinedButton(
                        onPressed: () {
                          wizardFormBloc.verifySate.successConfirmation();
                        },
                        child: Text(
                          tr('submit'),
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                        ),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1, color: wizardButtonColor),
                            backgroundColor: wizardButtonColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: tr('itMayTakeAMinuteToReceiveCode'),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: const Color(0xff4E4E4E))),
                      TextSpan(
                          text: tr('itMayTakeAMinuteToReceiveCode'),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: wizardButtonColor))
                    ])),
                  ),
                ],
              ),
            ));
            break;
          case VerifyState.verified:
            child = Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 108,
                    height: 108,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: SvgPicture.asset(
                        "assets/images/success_check_mark.svg"),
                  ),
                  Text(
                    tr('youPhoneNumberVerified'),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      constraints:
                          const BoxConstraints(maxWidth: 400, minWidth: 100),
                      child: OutlinedButton(
                        onPressed: () {
                          wizardFormBloc.verifySate.successConfirmation();
                        },
                        child: Text(
                          tr('checkTransferProgress'),
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                        ),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1, color: wizardButtonColor),
                            backgroundColor: wizardButtonColor),
                      ),
                    ),
                  )
                ]);
            break;
        }

        return Container(
          constraints: const BoxConstraints(maxWidth: 420),
          child: child,
        );
      },
    ),
  );
}
