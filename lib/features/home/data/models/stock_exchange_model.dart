import 'package:equatable/equatable.dart';

class StockExchange extends Equatable {
  final String name;
  final String acronym;
  final String mic;
  final String? country;
  final String countryCode;
  final String city;
  final String website;

  const StockExchange({
    required this.name,
    required this.acronym,
    required this.mic,
    this.country,
    required this.countryCode,
    required this.city,
    required this.website,
  });

  factory StockExchange.fromJson(Map<String, dynamic> json) {
    return StockExchange(
      name: json['name'] ?? 'Unknown Exchange',
      acronym: json['acronym'] ?? '',
      mic: json['mic'] ?? '',
      country: json['country'],
      countryCode: json['country_code'] ?? '',
      city: json['city'] ?? '',
      website: json['website'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'acronym': acronym,
      'mic': mic,
      'country': country,
      'country_code': countryCode,
      'city': city,
      'website': website,
    };
  }

  @override
  List<Object?> get props => [name, acronym, mic, country, countryCode, city, website];
}
