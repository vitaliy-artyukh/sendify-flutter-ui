import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sendify/bloc/wizard/wizard_form_bloc.dart';
import 'package:sendify/controls/wizard_text_field.dart';
import 'package:sendify/styles/app_style.dart';
import 'package:sendify/views/dialogs/terms_of_usage_dailog.dart';

// ignore: non_constant_identifier_names
FormBlocStep ReviewTransferStep(WizardFormBloc wizardFormBloc) {
  return FormBlocStep(
    title: Text(
      tr('reviewTransfer'),
      style: wizardHederStepHederStyle,
    ),
    content: Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('transferDetails'),
            textAlign: TextAlign.left,
            style: wizardStepHederStyle,
          ),
          WizardTextField(
              labelText: tr('youWillSend'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientFirstName,
                keyboardType: TextInputType.name,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('theyWillReceive'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientMiddleName,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('exchangeRate'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientLastName,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('totalFees'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientEmail,
                isEnabled: false,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: Text(
              tr('recipientDetails'),
              textAlign: TextAlign.left,
              style: wizardStepHederStyle,
            ),
          ),
          WizardTextField(
              labelText: tr('recipientFullName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientEmail,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('recipientEmail'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientEmail,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('recipientPhoneNumber'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientEmail,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('recipientBankCountry'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientEmail,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('recipientAccountNumber'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.middleName,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('recipientRoutingNumber'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.lastName,
                isEnabled: false,
              )),
          WizardTextField(
              labelText: tr('transferMemo'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.email,
                isEnabled: false,
              )),
          Builder(builder: (context) {
            var style = GoogleFonts.jost(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 18);
            return RichText(
              text: TextSpan(children: [
                TextSpan(text: tr('byContinuingIAcceptThe'), style: style),
                TextSpan(
                    text: tr('termsOfUsage'),
                    style: style.copyWith(color: wizardButtonColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showDialog(
                            context: context,
                            builder: (context) => const TermsOfUseDialog());
                      }),
              ]),
            );
          }),
        ],
      ),
    ),
  );
}
