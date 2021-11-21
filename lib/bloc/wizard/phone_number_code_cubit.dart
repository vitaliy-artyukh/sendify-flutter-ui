import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryPickerCubit extends Cubit<Country> {
  CountryPickerCubit() : super(countryList.firstWhere((element) => element.iso3Code == 'USA'));

  void updateValue(Country country) {
    if (country == state) return;
    emit(country);
  }
}
