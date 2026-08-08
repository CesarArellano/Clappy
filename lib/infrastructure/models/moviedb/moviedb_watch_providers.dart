class MoviedbWatchProvidersResponse {
  factory MoviedbWatchProvidersResponse.fromJson(Map<String, dynamic> json) =>
      MoviedbWatchProvidersResponse(
        id: json["id"],
        results: (json["results"] as Map<String, dynamic>? ?? {}).map(
          (countryCode, value) => MapEntry(
            countryCode,
            CountryWatchProviders.fromJson(value as Map<String, dynamic>),
          ),
        ),
      );
  MoviedbWatchProvidersResponse({required this.id, required this.results});

  final int id;
  final Map<String, CountryWatchProviders> results;

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": results.map((key, value) => MapEntry(key, value.toJson())),
  };
}

class CountryWatchProviders {
  factory CountryWatchProviders.fromJson(Map<String, dynamic> json) =>
      CountryWatchProviders(
        link: json["link"],
        flatrate: _providerList(json["flatrate"]),
        rent: _providerList(json["rent"]),
        buy: _providerList(json["buy"]),
        free: _providerList(json["free"]),
        ads: _providerList(json["ads"]),
      );
  CountryWatchProviders({
    required this.link,
    required this.flatrate,
    required this.rent,
    required this.buy,
    required this.free,
    required this.ads,
  });

  final String link;
  final List<MoviedbProvider> flatrate;
  final List<MoviedbProvider> rent;
  final List<MoviedbProvider> buy;
  final List<MoviedbProvider> free;
  final List<MoviedbProvider> ads;

  static List<MoviedbProvider> _providerList(dynamic value) => value == null
      ? []
      : List<MoviedbProvider>.from(
          (value as List).map((x) => MoviedbProvider.fromJson(x)),
        );

  Map<String, dynamic> toJson() => {
    "link": link,
    "flatrate": List<dynamic>.from(flatrate.map((x) => x.toJson())),
    "rent": List<dynamic>.from(rent.map((x) => x.toJson())),
    "buy": List<dynamic>.from(buy.map((x) => x.toJson())),
    "free": List<dynamic>.from(free.map((x) => x.toJson())),
    "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
  };
}

class MoviedbProvider {
  factory MoviedbProvider.fromJson(Map<String, dynamic> json) =>
      MoviedbProvider(
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        displayPriority: json["display_priority"],
      );
  MoviedbProvider({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  Map<String, dynamic> toJson() => {
    "logo_path": logoPath,
    "provider_id": providerId,
    "provider_name": providerName,
    "display_priority": displayPriority,
  };
}
