import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sendify/bloc/wizard/phone_number_code_cubit.dart';
import 'package:sendify/bloc/wizard/wizard_form_bloc.dart';
import 'package:sendify/controls/wizard_text_field.dart';
import 'package:sendify/styles/app_style.dart';

// ignore: non_constant_identifier_names
FormBlocStep PersonalDetailsStep(WizardFormBloc wizardFormBloc) {
  return FormBlocStep(
    title: Text(
      tr('yourDetails'),
      style: wizardHederStepHederStyle,
    ),
    content: Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('personalDetails'),
            textAlign: TextAlign.left,
            style: wizardStepHederStyle,
          ),
          WizardTextField(
              labelText: tr('yourFirstName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.firstName,
                keyboardType: TextInputType.name,
                enableOnlyWhenFormBlocCanSubmit: true,
              )),
          WizardTextField(
              labelText: tr('yourMiddleName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.middleName,
                keyboardType: TextInputType.name,
              )),
          WizardTextField(
              labelText: tr('yourLastName'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.lastName,
                keyboardType: TextInputType.name,
              )),
          WizardTextField(
              labelText: tr('yourEmailAddress'),
              field: TextFieldBlocBuilder(
                textFieldBloc: wizardFormBloc.email,
                keyboardType: TextInputType.emailAddress,
              )),
          WizardTextField(
              labelText: tr('yourPhoneNumber'),
              field: Stack(
                children: [
                  TextField(
                    controller: wizardFormBloc.phoneNumberEditingController,
                    inputFormatters: [wizardFormBloc.phoneNumberMaskFormatter],
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
                          bloc: wizardFormBloc.phoneNumberCountry,
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
        ],
      ),
    ),
  );
}
