import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sendify/bloc/wizard/phone_number_code_cubit.dart';
import 'package:sendify/bloc/wizard/wizard_form_bloc.dart';
import 'package:sendify/controls/wizard_text_field.dart';
import 'package:sendify/styles/app_style.dart';

// ignore: non_constant_identifier_names
FormBlocStep RecipientDetailsStep(WizardFormBloc wizardFormBloc) {
  return FormBlocStep(
    title: Text(
      tr('recipientDetails'),
      style: wizardHederStepHederStyle,
    ),
    content: Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('recipientDetails'),
            textAlign: TextAlign.left,
            style: wizardStepHederStyle,
          ),
          WizardTextField(
              labelText: tr('recipientFirstName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientFirstName,
                keyboardType: TextInputType.name,
                enableOnlyWhenFormBlocCanSubmit: true,
              )),
          WizardTextField(
              labelText: tr('recipientMiddleName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientMiddleName,
                keyboardType: TextInputType.name,
              )),
          WizardTextField(
              labelText: tr('recipientLastName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientLastName,
                keyboardType: TextInputType.name,
              )),
          WizardTextField(
              labelText: tr('recipientEmailAddress'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.recipientEmail,
                keyboardType: TextInputType.emailAddress,
              )),
          WizardTextField(
              labelText: tr('recipientPhoneNumber'),
              field: Stack(
                children: [
                  TextField(
                    controller:
                        wizardFormBloc.recipientPhoneNumberEditingController,
                    inputFormatters: [
                      wizardFormBloc.recipientPhoneNumberMaskFormatter
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(110, 0, 0, 0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 0, 0),
                    child: Container(
                      height: 44,
                      color: const Color(0xffD1D1D1),
                      child: Builder(builder: (context) {
                        return BlocBuilder<CountryPickerCubit, Country>(
                          bloc: wizardFormBloc.recipientPhoneNumberCountry,
                          builder: (context, currentCountry) {
                            return OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 0.0, color: Colors.transparent),
                              ),
                              onPressed: () => {
                                showDialog(
                                  context: context,
                                  builder: (context) => CountryPickerDialog(
                                    titlePadding: const EdgeInsets.all(8.0),
                                    searchInputDecoration: InputDecoration(
                                        hintText: tr('SearchPlaceholder')),
                                    isSearchable: true,
                                    title: Text(
                                      tr('selectPhoneCode'),
                                      style: wizardStepHederStyle,
                                    ),
                                    itemBuilder: (Country country) => Row(
                                      children: <Widget>[
                                        CountryPickerUtils.getDefaultFlagImage(
                                            country),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                            "+${country.phoneCode}(${country.isoCode})"),
                                      ],
                                    ),
                                    onValuePicked: (Country value) {
                                      wizardFormBloc.phoneNumberCountry
                                          .updateValue(value);
                                    },
                                  ),
                                )
                              },
                              child: SizedBox(
                                width: 62,
                                child: Row(
                                  children: [
                                    CountryPickerUtils.getDefaultFlagImage(
                                        currentCountry),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    const Icon(
                                      Icons.expand_more,
                                      color: Colors.black,
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: Text(
              tr('bankDetails'),
              textAlign: TextAlign.left,
              style: wizardStepHederStyle,
            ),
          ),
          WizardTextField(
              labelText: tr('recipientBankCountry'),
              field: SizedBox(
                height: 48,
                child: Builder(builder: (context) {
                  var theme = Theme.of(context);
                  return BlocBuilder<CountryPickerCubit, Country>(
                    bloc: wizardFormBloc.recipientBankCountry,
                    builder: (context, currentCountry) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(width: 1.0, color: theme.primaryColor),
                        ),
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => CountryPickerDialog(
                              titlePadding: const EdgeInsets.all(8.0),
                              searchInputDecoration: InputDecoration(
                                  hintText: tr('SearchPlaceholder')),
                              isSearchable: true,
                              title: Text(
                                tr('selectCountry'),
                                style: wizardStepHederStyle,
                              ),
                              itemBuilder: (Country country) => Row(
                                children: <Widget>[
                                  CountryPickerUtils.getDefaultFlagImage(
                                      country),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(country.name),
                                ],
                              ),
                              onValuePicked: (Country value) {
                                wizardFormBloc.recipientBankCountry
                                    .updateValue(value);
                              },
                            ),
                          )
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              CountryPickerUtils.getDefaultFlagImage(
                                  currentCountry),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                                child: Text(
                                  currentCountry.name,
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.expand_more,
                                color: Colors.black,
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                        ),
                      );
                    },
                  );
                }),
              )),
          WizardTextField(
              labelText: tr('recipientAccountNumber'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.middleName,
                keyboardType: TextInputType.name,
              )),
          WizardTextField(
              labelText: tr('recipientRoutingNumber'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.lastName,
                keyboardType: TextInputType.name,
              )),
          WizardTextField(
              labelText: tr('transferMemo'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.email,
                keyboardType: TextInputType.text,
              )),
        ],
      ),
    ),
  );
}
