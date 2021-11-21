import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sendify/styles/resources.dart';

class TransferBloc extends FormBloc<String, String> {
  final sendCurrencies = SelectFieldBloc(
    items: Resources.instance.currencies,
  );
  final CurrencyTextInputFormatter sendCurrencyFormatter =
      CurrencyTextInputFormatter(symbol: null);

  @override
  void onSubmitting() {}

  void dispose() {}
}
