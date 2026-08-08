enum WatchProviderCategory { flatrate, rent, buy, free, ads }

class WatchProvider {
  WatchProvider({
    required this.providerId,
    required this.providerName,
    required this.logoPath,
    required this.displayPriority,
  });

  final int providerId;
  final String providerName;
  final String logoPath;
  final int displayPriority;
}

class WatchProviders {
  WatchProviders({required this.link, required this.categories});

  final String? link;
  final Map<WatchProviderCategory, List<WatchProvider>> categories;

  bool get isEmpty => categories.values.every((providers) => providers.isEmpty);
}
