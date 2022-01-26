import 'package:flutter/material.dart';
import '../screens/countries_dialog.dart';
import '../config.dart';
import '../services/country_service.dart';
import '../models/country.dart';

class HomeScreenController extends ChangeNotifier {
  List<Country>? countries;
  Country? initialCountry;

  HomeScreenController() {
    CountryService.getCountries().then((value) {
      countries = value;
      initialCountry = value.firstWhere(
        (element) => element.iso1 == 'TN',
        orElse: () => value[0],
      );
      notifyListeners();
    });
  }

  void showCoutriesDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return CountriesDialog(
          controller: this,
        );
      },
    );
  }

  void selectCountry(Country country) {
    initialCountry = country;
    notifyListeners();
    Navigator.of(navigatorKey.currentContext!).pop();
  }
}
