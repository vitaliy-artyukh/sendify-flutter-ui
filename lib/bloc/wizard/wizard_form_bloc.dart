import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sendify/bloc/wizard/deposit_methods_cubit.dart';
import 'package:sendify/bloc/wizard/phone_number_code_cubit.dart';
import 'package:sendify/bloc/wizard/verify_state_cubit.dart';
import 'package:sendify/models/deposit_method.dart';
import 'package:sendify/styles/resources.dart';
import 'package:sendify/utils/stream_utils.dart';

class WizardFormBloc extends FormBloc<String, String> {
  final firstName = TextFieldBloc(
      // validators: [FieldBlocValidators.required],
      );

  final middleName = TextFieldBloc();

  final lastName = TextFieldBloc(
      // validators: [FieldBlocValidators.required],
      );

  final email = TextFieldBloc<String>(
      // validators: [
      //   FieldBlocValidators.required,
      //   FieldBlocValidators.email,
      // ],
      );

  final phoneNumberCountry = CountryPickerCubit();

  final phoneNumber = TextFieldBloc(
      // validators: [FieldBlocValidators.required],
      );

  final phoneNumberEditingController = TextEditingController();
  final phoneNumberMaskFormatter = MaskTextInputFormatter(
      mask: '+1 ### ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  final recipientBankCountry = CountryPickerCubit();

  final recipientFirstName = TextFieldBloc(
      // validators: [FieldBlocValidators.required],
      );

  final recipientMiddleName = TextFieldBloc();

  final recipientLastName = TextFieldBloc(
      // validators: [FieldBlocValidators.required],
      );

  final recipientEmail = TextFieldBloc<String>(
      // validators: [
      //   FieldBlocValidators.required,
      //   FieldBlocValidators.email,
      // ],
      );

  final recipientPhoneNumberCountry = CountryPickerCubit();

  final recipientPhoneNumberEditingController = TextEditingController();
  final recipientPhoneNumberMaskFormatter = MaskTextInputFormatter(
      mask: '+1 ### ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  final recipientPhoneNumber = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  final depositMethodsCubit = DepositMethodCubit([
    DepositMethod(titleKey: 'domesticWire', id: UniqueKey()),
    DepositMethod(titleKey: 'internationalSwift', id: UniqueKey()),
    DepositMethod(titleKey: 'sepaTransfer', id: UniqueKey()),
    DepositMethod(titleKey: 'applePay', id: UniqueKey()),
  ]);

  final verifySate = VerifyCubit();

  final confirmCodeFocusNodes = List.generate(4, (index) => FocusNode());
  final confirmCodeFieldBlocs = List.generate(
      4,
      (index) => TextFieldBloc(
            validators: [FieldBlocValidators.required],
          ));

  final List<StreamSubscription> _compositeDisposable =
      List.empty(growable: true);

  WizardFormBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [firstName, lastName, middleName, email],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [
        recipientFirstName,
        recipientLastName,
        recipientMiddleName,
        recipientEmail
      ],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [
        recipientFirstName,
        recipientLastName,
        recipientMiddleName,
        recipientEmail
      ],
    );
    addFieldBlocs(
      step: 3,
      fieldBlocs: [
        recipientFirstName,
        recipientLastName,
        recipientMiddleName,
        recipientEmail
      ],
    );
    addFieldBlocs(
      step: 4,
      fieldBlocs: [
        recipientFirstName,
        recipientLastName,
        recipientMiddleName,
        recipientEmail
      ],
    );

    _preparePhoneNumberContryPicker(
            phoneNumberCountry,
            phoneNumberEditingController,
            phoneNumberMaskFormatter,
            _phoneNumberChnaged)
        .disposeWith(_compositeDisposable);

    _preparePhoneNumberContryPicker(
            recipientPhoneNumberCountry,
            recipientPhoneNumberEditingController,
            recipientPhoneNumberMaskFormatter,
            _recipientPhoneNumberChnaged)
        .disposeWith(_compositeDisposable);

    verifySate.stream.listen((event) {
      //TODO: verifySate.stream.listen impl
    }).disposeWith(_compositeDisposable);

    for (var i = 0; i < 4; i++) {
      if (i == 3) {
        continue;
      }

      prepareConfirmCodeFields(
          confirmCodeFieldBlocs[i], confirmCodeFocusNodes[i + 1]);
    }
  }

  void prepareConfirmCodeFields(
      TextFieldBloc<dynamic> textFieldBloc, FocusNode? nextFocus) {
    textFieldBloc.stream.listen((event) {
      if (!event.hasValue) {
        return;
      }
      nextFocus?.requestFocus();
    }).disposeWith(_compositeDisposable);
  }

  void _phoneNumberChnaged() {
    //TODO: _phoneNumberChnaged
  }
  void _recipientPhoneNumberChnaged() {
    //TODO: _recipientPhoneNumberChnaged
  }

  StreamSubscription _preparePhoneNumberContryPicker(
      CountryPickerCubit countryPickerCubit,
      TextEditingController controller,
      MaskTextInputFormatter formatter,
      Function() onPhoneNumberChanged) {
    controller.addListener(onPhoneNumberChanged);

    return countryPickerCubit.stream.listen((country) {
      var key = '';

      for (var item in Resources.instance.culturesInfoMap!.entries) {
        if (item.key.endsWith(country.isoCode)) {
          key = item.key;
          break;
        }
      }

      if (key.isEmpty) {
        return;
      }

      controller.value = formatter.updateMask(
          mask: Resources
              .instance.culturesInfoMap![key]!.phoneNumberMaskStr!.first);
    });
  }

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      emitSuccess();
      if (!phoneNumberMaskFormatter.isFill()) {
        return;
      }
    } else if (state.currentStep == 1) {
      emitSuccess();
      if (!recipientPhoneNumberMaskFormatter.isFill()) {
        return;
      }
    } else if (state.currentStep == 2) {
      emitSuccess();
    } else if (state.currentStep == 3) {
      emitSuccess();
      confirmCodeFocusNodes[0].requestFocus();
    } else if (state.currentStep == 4) {
      emitSuccess();
    }
  }

  void dispose() {
    _compositeDisposable.dispose();

    phoneNumberEditingController.removeListener(_phoneNumberChnaged);

    recipientPhoneNumberEditingController
        .removeListener(_recipientPhoneNumberChnaged);
  }
}
