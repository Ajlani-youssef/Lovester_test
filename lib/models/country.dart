class Country {
  final String name;
  final String iso1;
  final String iso2;

  Country({required this.name, required this.iso1, required this.iso2});

  factory Country.fromJson(dynamic json) {
    return Country(
      name: json['name'] as String,
      iso1: json['Iso2'] as String,
      iso2: json['Iso3'] as String,
    );
  }
}
