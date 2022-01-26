import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../models/country.dart';

class CountryService {
  static Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)["data"];
      List<Country> countries = body.map((dynamic item) {
        return Country.fromJson(item);
      }).toList();
      return countries;
    } else {
      throw jsonDecode(response.body)["error"];
    }
  }
}
