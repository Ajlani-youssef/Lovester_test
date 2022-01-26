import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../config.dart';
import '../models/country.dart';

class CountryService {
  static Future<List<Country>> getCountries() async {
    String filename = "countries.json";
    var dir = await getTemporaryDirectory();
    File file = File(dir.path + "/" + filename);
    if (file.existsSync()) {
      var jsonData = file.readAsStringSync();
      List<dynamic> body = jsonDecode(jsonData)["data"];

      List<Country> countries = body.map((dynamic item) {
        return Country.fromJson(item);
      }).toList();
      return countries;
    } else {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body)["data"];
        file.writeAsStringSync(response.body,
            flush: true, mode: FileMode.write);
        List<Country> countries = body.map((dynamic item) {
          return Country.fromJson(item);
        }).toList();
        return countries;
      } else {
        throw jsonDecode(response.body)["error"];
      }
    }
  }
}
