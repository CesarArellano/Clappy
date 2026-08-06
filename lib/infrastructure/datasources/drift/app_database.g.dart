// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MoviesTableTable extends MoviesTable
    with TableInfo<$MoviesTableTable, MovieEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool> adult = GeneratedColumn<bool>(
    'adult',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("adult" IN (0, 1))',
    ),
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genreIdsMeta = const VerificationMeta(
    'genreIds',
  );
  @override
  late final GeneratedColumn<String> genreIds = GeneratedColumn<String>(
    'genre_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalLanguageMeta = const VerificationMeta(
    'originalLanguage',
  );
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
    'original_language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalTitleMeta = const VerificationMeta(
    'originalTitle',
  );
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
    'original_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _popularityMeta = const VerificationMeta(
    'popularity',
  );
  @override
  late final GeneratedColumn<double> popularity = GeneratedColumn<double>(
    'popularity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _releaseDateMeta = const VerificationMeta(
    'releaseDate',
  );
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
    'release_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoMeta = const VerificationMeta('video');
  @override
  late final GeneratedColumn<bool> video = GeneratedColumn<bool>(
    'video',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("video" IN (0, 1))',
    ),
  );
  static const VerificationMeta _voteAverageMeta = const VerificationMeta(
    'voteAverage',
  );
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
    'vote_average',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voteCountMeta = const VerificationMeta(
    'voteCount',
  );
  @override
  late final GeneratedColumn<int> voteCount = GeneratedColumn<int>(
    'vote_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
    'budget',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revenueMeta = const VerificationMeta(
    'revenue',
  );
  @override
  late final GeneratedColumn<int> revenue = GeneratedColumn<int>(
    'revenue',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _runtimeMeta = const VerificationMeta(
    'runtime',
  );
  @override
  late final GeneratedColumn<int> runtime = GeneratedColumn<int>(
    'runtime',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heroIdMeta = const VerificationMeta('heroId');
  @override
  late final GeneratedColumn<String> heroId = GeneratedColumn<String>(
    'hero_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    adult,
    backdropPath,
    genreIds,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
    budget,
    revenue,
    runtime,
    heroId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies';
  @override
  VerificationContext validateIntegrity(
    Insertable<MovieEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('adult')) {
      context.handle(
        _adultMeta,
        adult.isAcceptableOrUnknown(data['adult']!, _adultMeta),
      );
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    }
    if (data.containsKey('genre_ids')) {
      context.handle(
        _genreIdsMeta,
        genreIds.isAcceptableOrUnknown(data['genre_ids']!, _genreIdsMeta),
      );
    }
    if (data.containsKey('original_language')) {
      context.handle(
        _originalLanguageMeta,
        originalLanguage.isAcceptableOrUnknown(
          data['original_language']!,
          _originalLanguageMeta,
        ),
      );
    }
    if (data.containsKey('original_title')) {
      context.handle(
        _originalTitleMeta,
        originalTitle.isAcceptableOrUnknown(
          data['original_title']!,
          _originalTitleMeta,
        ),
      );
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    }
    if (data.containsKey('popularity')) {
      context.handle(
        _popularityMeta,
        popularity.isAcceptableOrUnknown(data['popularity']!, _popularityMeta),
      );
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    if (data.containsKey('release_date')) {
      context.handle(
        _releaseDateMeta,
        releaseDate.isAcceptableOrUnknown(
          data['release_date']!,
          _releaseDateMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('video')) {
      context.handle(
        _videoMeta,
        video.isAcceptableOrUnknown(data['video']!, _videoMeta),
      );
    }
    if (data.containsKey('vote_average')) {
      context.handle(
        _voteAverageMeta,
        voteAverage.isAcceptableOrUnknown(
          data['vote_average']!,
          _voteAverageMeta,
        ),
      );
    }
    if (data.containsKey('vote_count')) {
      context.handle(
        _voteCountMeta,
        voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta),
      );
    }
    if (data.containsKey('budget')) {
      context.handle(
        _budgetMeta,
        budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta),
      );
    }
    if (data.containsKey('revenue')) {
      context.handle(
        _revenueMeta,
        revenue.isAcceptableOrUnknown(data['revenue']!, _revenueMeta),
      );
    }
    if (data.containsKey('runtime')) {
      context.handle(
        _runtimeMeta,
        runtime.isAcceptableOrUnknown(data['runtime']!, _runtimeMeta),
      );
    }
    if (data.containsKey('hero_id')) {
      context.handle(
        _heroIdMeta,
        heroId.isAcceptableOrUnknown(data['hero_id']!, _heroIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      adult: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}adult'],
      ),
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      ),
      genreIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre_ids'],
      ),
      originalLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_language'],
      ),
      originalTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_title'],
      ),
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      ),
      popularity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}popularity'],
      ),
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
      releaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}release_date'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      video: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}video'],
      ),
      voteAverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vote_average'],
      ),
      voteCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vote_count'],
      ),
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}budget'],
      ),
      revenue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revenue'],
      ),
      runtime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}runtime'],
      ),
      heroId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hero_id'],
      ),
    );
  }

  @override
  $MoviesTableTable createAlias(String alias) {
    return $MoviesTableTable(attachedDatabase, alias);
  }
}

class MovieEntry extends DataClass implements Insertable<MovieEntry> {
  final int id;
  final bool? adult;
  final String? backdropPath;
  final String? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final int? budget;
  final int? revenue;
  final int? runtime;
  final String? heroId;
  const MovieEntry({
    required this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.revenue,
    this.runtime,
    this.heroId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<bool>(adult);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || genreIds != null) {
      map['genre_ids'] = Variable<String>(genreIds);
    }
    if (!nullToAbsent || originalLanguage != null) {
      map['original_language'] = Variable<String>(originalLanguage);
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double>(popularity);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<DateTime>(releaseDate);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || video != null) {
      map['video'] = Variable<bool>(video);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || budget != null) {
      map['budget'] = Variable<int>(budget);
    }
    if (!nullToAbsent || revenue != null) {
      map['revenue'] = Variable<int>(revenue);
    }
    if (!nullToAbsent || runtime != null) {
      map['runtime'] = Variable<int>(runtime);
    }
    if (!nullToAbsent || heroId != null) {
      map['hero_id'] = Variable<String>(heroId);
    }
    return map;
  }

  MoviesTableCompanion toCompanion(bool nullToAbsent) {
    return MoviesTableCompanion(
      id: Value(id),
      adult: adult == null && nullToAbsent
          ? const Value.absent()
          : Value(adult),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      genreIds: genreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(genreIds),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      video: video == null && nullToAbsent
          ? const Value.absent()
          : Value(video),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      budget: budget == null && nullToAbsent
          ? const Value.absent()
          : Value(budget),
      revenue: revenue == null && nullToAbsent
          ? const Value.absent()
          : Value(revenue),
      runtime: runtime == null && nullToAbsent
          ? const Value.absent()
          : Value(runtime),
      heroId: heroId == null && nullToAbsent
          ? const Value.absent()
          : Value(heroId),
    );
  }

  factory MovieEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieEntry(
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool?>(json['adult']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      genreIds: serializer.fromJson<String?>(json['genreIds']),
      originalLanguage: serializer.fromJson<String?>(json['originalLanguage']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      overview: serializer.fromJson<String?>(json['overview']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
      title: serializer.fromJson<String?>(json['title']),
      video: serializer.fromJson<bool?>(json['video']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
      budget: serializer.fromJson<int?>(json['budget']),
      revenue: serializer.fromJson<int?>(json['revenue']),
      runtime: serializer.fromJson<int?>(json['runtime']),
      heroId: serializer.fromJson<String?>(json['heroId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool?>(adult),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'genreIds': serializer.toJson<String?>(genreIds),
      'originalLanguage': serializer.toJson<String?>(originalLanguage),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'overview': serializer.toJson<String?>(overview),
      'popularity': serializer.toJson<double?>(popularity),
      'posterPath': serializer.toJson<String?>(posterPath),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
      'title': serializer.toJson<String?>(title),
      'video': serializer.toJson<bool?>(video),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'voteCount': serializer.toJson<int?>(voteCount),
      'budget': serializer.toJson<int?>(budget),
      'revenue': serializer.toJson<int?>(revenue),
      'runtime': serializer.toJson<int?>(runtime),
      'heroId': serializer.toJson<String?>(heroId),
    };
  }

  MovieEntry copyWith({
    int? id,
    Value<bool?> adult = const Value.absent(),
    Value<String?> backdropPath = const Value.absent(),
    Value<String?> genreIds = const Value.absent(),
    Value<String?> originalLanguage = const Value.absent(),
    Value<String?> originalTitle = const Value.absent(),
    Value<String?> overview = const Value.absent(),
    Value<double?> popularity = const Value.absent(),
    Value<String?> posterPath = const Value.absent(),
    Value<DateTime?> releaseDate = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<bool?> video = const Value.absent(),
    Value<double?> voteAverage = const Value.absent(),
    Value<int?> voteCount = const Value.absent(),
    Value<int?> budget = const Value.absent(),
    Value<int?> revenue = const Value.absent(),
    Value<int?> runtime = const Value.absent(),
    Value<String?> heroId = const Value.absent(),
  }) => MovieEntry(
    id: id ?? this.id,
    adult: adult.present ? adult.value : this.adult,
    backdropPath: backdropPath.present ? backdropPath.value : this.backdropPath,
    genreIds: genreIds.present ? genreIds.value : this.genreIds,
    originalLanguage: originalLanguage.present
        ? originalLanguage.value
        : this.originalLanguage,
    originalTitle: originalTitle.present
        ? originalTitle.value
        : this.originalTitle,
    overview: overview.present ? overview.value : this.overview,
    popularity: popularity.present ? popularity.value : this.popularity,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
    releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
    title: title.present ? title.value : this.title,
    video: video.present ? video.value : this.video,
    voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
    voteCount: voteCount.present ? voteCount.value : this.voteCount,
    budget: budget.present ? budget.value : this.budget,
    revenue: revenue.present ? revenue.value : this.revenue,
    runtime: runtime.present ? runtime.value : this.runtime,
    heroId: heroId.present ? heroId.value : this.heroId,
  );
  MovieEntry copyWithCompanion(MoviesTableCompanion data) {
    return MovieEntry(
      id: data.id.present ? data.id.value : this.id,
      adult: data.adult.present ? data.adult.value : this.adult,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      genreIds: data.genreIds.present ? data.genreIds.value : this.genreIds,
      originalLanguage: data.originalLanguage.present
          ? data.originalLanguage.value
          : this.originalLanguage,
      originalTitle: data.originalTitle.present
          ? data.originalTitle.value
          : this.originalTitle,
      overview: data.overview.present ? data.overview.value : this.overview,
      popularity: data.popularity.present
          ? data.popularity.value
          : this.popularity,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
      releaseDate: data.releaseDate.present
          ? data.releaseDate.value
          : this.releaseDate,
      title: data.title.present ? data.title.value : this.title,
      video: data.video.present ? data.video.value : this.video,
      voteAverage: data.voteAverage.present
          ? data.voteAverage.value
          : this.voteAverage,
      voteCount: data.voteCount.present ? data.voteCount.value : this.voteCount,
      budget: data.budget.present ? data.budget.value : this.budget,
      revenue: data.revenue.present ? data.revenue.value : this.revenue,
      runtime: data.runtime.present ? data.runtime.value : this.runtime,
      heroId: data.heroId.present ? data.heroId.value : this.heroId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovieEntry(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('genreIds: $genreIds, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('title: $title, ')
          ..write('video: $video, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('budget: $budget, ')
          ..write('revenue: $revenue, ')
          ..write('runtime: $runtime, ')
          ..write('heroId: $heroId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    adult,
    backdropPath,
    genreIds,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
    budget,
    revenue,
    runtime,
    heroId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieEntry &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.genreIds == this.genreIds &&
          other.originalLanguage == this.originalLanguage &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.popularity == this.popularity &&
          other.posterPath == this.posterPath &&
          other.releaseDate == this.releaseDate &&
          other.title == this.title &&
          other.video == this.video &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount &&
          other.budget == this.budget &&
          other.revenue == this.revenue &&
          other.runtime == this.runtime &&
          other.heroId == this.heroId);
}

class MoviesTableCompanion extends UpdateCompanion<MovieEntry> {
  final Value<int> id;
  final Value<bool?> adult;
  final Value<String?> backdropPath;
  final Value<String?> genreIds;
  final Value<String?> originalLanguage;
  final Value<String?> originalTitle;
  final Value<String?> overview;
  final Value<double?> popularity;
  final Value<String?> posterPath;
  final Value<DateTime?> releaseDate;
  final Value<String?> title;
  final Value<bool?> video;
  final Value<double?> voteAverage;
  final Value<int?> voteCount;
  final Value<int?> budget;
  final Value<int?> revenue;
  final Value<int?> runtime;
  final Value<String?> heroId;
  const MoviesTableCompanion({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.title = const Value.absent(),
    this.video = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.budget = const Value.absent(),
    this.revenue = const Value.absent(),
    this.runtime = const Value.absent(),
    this.heroId = const Value.absent(),
  });
  MoviesTableCompanion.insert({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.title = const Value.absent(),
    this.video = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.budget = const Value.absent(),
    this.revenue = const Value.absent(),
    this.runtime = const Value.absent(),
    this.heroId = const Value.absent(),
  });
  static Insertable<MovieEntry> custom({
    Expression<int>? id,
    Expression<bool>? adult,
    Expression<String>? backdropPath,
    Expression<String>? genreIds,
    Expression<String>? originalLanguage,
    Expression<String>? originalTitle,
    Expression<String>? overview,
    Expression<double>? popularity,
    Expression<String>? posterPath,
    Expression<DateTime>? releaseDate,
    Expression<String>? title,
    Expression<bool>? video,
    Expression<double>? voteAverage,
    Expression<int>? voteCount,
    Expression<int>? budget,
    Expression<int>? revenue,
    Expression<int>? runtime,
    Expression<String>? heroId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (genreIds != null) 'genre_ids': genreIds,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (popularity != null) 'popularity': popularity,
      if (posterPath != null) 'poster_path': posterPath,
      if (releaseDate != null) 'release_date': releaseDate,
      if (title != null) 'title': title,
      if (video != null) 'video': video,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
      if (budget != null) 'budget': budget,
      if (revenue != null) 'revenue': revenue,
      if (runtime != null) 'runtime': runtime,
      if (heroId != null) 'hero_id': heroId,
    });
  }

  MoviesTableCompanion copyWith({
    Value<int>? id,
    Value<bool?>? adult,
    Value<String?>? backdropPath,
    Value<String?>? genreIds,
    Value<String?>? originalLanguage,
    Value<String?>? originalTitle,
    Value<String?>? overview,
    Value<double?>? popularity,
    Value<String?>? posterPath,
    Value<DateTime?>? releaseDate,
    Value<String?>? title,
    Value<bool?>? video,
    Value<double?>? voteAverage,
    Value<int?>? voteCount,
    Value<int?>? budget,
    Value<int?>? revenue,
    Value<int?>? runtime,
    Value<String?>? heroId,
  }) {
    return MoviesTableCompanion(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      budget: budget ?? this.budget,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      heroId: heroId ?? this.heroId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (genreIds.present) {
      map['genre_ids'] = Variable<String>(genreIds.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (video.present) {
      map['video'] = Variable<bool>(video.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    if (revenue.present) {
      map['revenue'] = Variable<int>(revenue.value);
    }
    if (runtime.present) {
      map['runtime'] = Variable<int>(runtime.value);
    }
    if (heroId.present) {
      map['hero_id'] = Variable<String>(heroId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesTableCompanion(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('genreIds: $genreIds, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('title: $title, ')
          ..write('video: $video, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('budget: $budget, ')
          ..write('revenue: $revenue, ')
          ..write('runtime: $runtime, ')
          ..write('heroId: $heroId')
          ..write(')'))
        .toString();
  }
}

class $SeriesTableTable extends SeriesTable
    with TableInfo<$SeriesTableTable, SeriesEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool> adult = GeneratedColumn<bool>(
    'adult',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("adult" IN (0, 1))',
    ),
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genreIdsMeta = const VerificationMeta(
    'genreIds',
  );
  @override
  late final GeneratedColumn<String> genreIds = GeneratedColumn<String>(
    'genre_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalLanguageMeta = const VerificationMeta(
    'originalLanguage',
  );
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
    'original_language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalNameMeta = const VerificationMeta(
    'originalName',
  );
  @override
  late final GeneratedColumn<String> originalName = GeneratedColumn<String>(
    'original_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _popularityMeta = const VerificationMeta(
    'popularity',
  );
  @override
  late final GeneratedColumn<double> popularity = GeneratedColumn<double>(
    'popularity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstAirDateMeta = const VerificationMeta(
    'firstAirDate',
  );
  @override
  late final GeneratedColumn<DateTime> firstAirDate = GeneratedColumn<DateTime>(
    'first_air_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voteAverageMeta = const VerificationMeta(
    'voteAverage',
  );
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
    'vote_average',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voteCountMeta = const VerificationMeta(
    'voteCount',
  );
  @override
  late final GeneratedColumn<int> voteCount = GeneratedColumn<int>(
    'vote_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberOfSeasonsMeta = const VerificationMeta(
    'numberOfSeasons',
  );
  @override
  late final GeneratedColumn<int> numberOfSeasons = GeneratedColumn<int>(
    'number_of_seasons',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberOfEpisodesMeta = const VerificationMeta(
    'numberOfEpisodes',
  );
  @override
  late final GeneratedColumn<int> numberOfEpisodes = GeneratedColumn<int>(
    'number_of_episodes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    adult,
    backdropPath,
    genreIds,
    originalLanguage,
    originalName,
    overview,
    popularity,
    posterPath,
    firstAirDate,
    name,
    voteAverage,
    voteCount,
    numberOfSeasons,
    numberOfEpisodes,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'series';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeriesEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('adult')) {
      context.handle(
        _adultMeta,
        adult.isAcceptableOrUnknown(data['adult']!, _adultMeta),
      );
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    }
    if (data.containsKey('genre_ids')) {
      context.handle(
        _genreIdsMeta,
        genreIds.isAcceptableOrUnknown(data['genre_ids']!, _genreIdsMeta),
      );
    }
    if (data.containsKey('original_language')) {
      context.handle(
        _originalLanguageMeta,
        originalLanguage.isAcceptableOrUnknown(
          data['original_language']!,
          _originalLanguageMeta,
        ),
      );
    }
    if (data.containsKey('original_name')) {
      context.handle(
        _originalNameMeta,
        originalName.isAcceptableOrUnknown(
          data['original_name']!,
          _originalNameMeta,
        ),
      );
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    }
    if (data.containsKey('popularity')) {
      context.handle(
        _popularityMeta,
        popularity.isAcceptableOrUnknown(data['popularity']!, _popularityMeta),
      );
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    if (data.containsKey('first_air_date')) {
      context.handle(
        _firstAirDateMeta,
        firstAirDate.isAcceptableOrUnknown(
          data['first_air_date']!,
          _firstAirDateMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('vote_average')) {
      context.handle(
        _voteAverageMeta,
        voteAverage.isAcceptableOrUnknown(
          data['vote_average']!,
          _voteAverageMeta,
        ),
      );
    }
    if (data.containsKey('vote_count')) {
      context.handle(
        _voteCountMeta,
        voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta),
      );
    }
    if (data.containsKey('number_of_seasons')) {
      context.handle(
        _numberOfSeasonsMeta,
        numberOfSeasons.isAcceptableOrUnknown(
          data['number_of_seasons']!,
          _numberOfSeasonsMeta,
        ),
      );
    }
    if (data.containsKey('number_of_episodes')) {
      context.handle(
        _numberOfEpisodesMeta,
        numberOfEpisodes.isAcceptableOrUnknown(
          data['number_of_episodes']!,
          _numberOfEpisodesMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SeriesEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeriesEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      adult: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}adult'],
      ),
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      ),
      genreIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre_ids'],
      ),
      originalLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_language'],
      ),
      originalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_name'],
      ),
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      ),
      popularity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}popularity'],
      ),
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
      firstAirDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}first_air_date'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      voteAverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vote_average'],
      ),
      voteCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vote_count'],
      ),
      numberOfSeasons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_seasons'],
      ),
      numberOfEpisodes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_episodes'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $SeriesTableTable createAlias(String alias) {
    return $SeriesTableTable(attachedDatabase, alias);
  }
}

class SeriesEntry extends DataClass implements Insertable<SeriesEntry> {
  final int id;
  final bool? adult;
  final String? backdropPath;
  final String? genreIds;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final int? numberOfSeasons;
  final int? numberOfEpisodes;
  final String? status;
  const SeriesEntry({
    required this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.numberOfSeasons,
    this.numberOfEpisodes,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<bool>(adult);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || genreIds != null) {
      map['genre_ids'] = Variable<String>(genreIds);
    }
    if (!nullToAbsent || originalLanguage != null) {
      map['original_language'] = Variable<String>(originalLanguage);
    }
    if (!nullToAbsent || originalName != null) {
      map['original_name'] = Variable<String>(originalName);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double>(popularity);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || firstAirDate != null) {
      map['first_air_date'] = Variable<DateTime>(firstAirDate);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || numberOfSeasons != null) {
      map['number_of_seasons'] = Variable<int>(numberOfSeasons);
    }
    if (!nullToAbsent || numberOfEpisodes != null) {
      map['number_of_episodes'] = Variable<int>(numberOfEpisodes);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  SeriesTableCompanion toCompanion(bool nullToAbsent) {
    return SeriesTableCompanion(
      id: Value(id),
      adult: adult == null && nullToAbsent
          ? const Value.absent()
          : Value(adult),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      genreIds: genreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(genreIds),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      originalName: originalName == null && nullToAbsent
          ? const Value.absent()
          : Value(originalName),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      firstAirDate: firstAirDate == null && nullToAbsent
          ? const Value.absent()
          : Value(firstAirDate),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      numberOfSeasons: numberOfSeasons == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfSeasons),
      numberOfEpisodes: numberOfEpisodes == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfEpisodes),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory SeriesEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeriesEntry(
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool?>(json['adult']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      genreIds: serializer.fromJson<String?>(json['genreIds']),
      originalLanguage: serializer.fromJson<String?>(json['originalLanguage']),
      originalName: serializer.fromJson<String?>(json['originalName']),
      overview: serializer.fromJson<String?>(json['overview']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      firstAirDate: serializer.fromJson<DateTime?>(json['firstAirDate']),
      name: serializer.fromJson<String?>(json['name']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
      numberOfSeasons: serializer.fromJson<int?>(json['numberOfSeasons']),
      numberOfEpisodes: serializer.fromJson<int?>(json['numberOfEpisodes']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool?>(adult),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'genreIds': serializer.toJson<String?>(genreIds),
      'originalLanguage': serializer.toJson<String?>(originalLanguage),
      'originalName': serializer.toJson<String?>(originalName),
      'overview': serializer.toJson<String?>(overview),
      'popularity': serializer.toJson<double?>(popularity),
      'posterPath': serializer.toJson<String?>(posterPath),
      'firstAirDate': serializer.toJson<DateTime?>(firstAirDate),
      'name': serializer.toJson<String?>(name),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'voteCount': serializer.toJson<int?>(voteCount),
      'numberOfSeasons': serializer.toJson<int?>(numberOfSeasons),
      'numberOfEpisodes': serializer.toJson<int?>(numberOfEpisodes),
      'status': serializer.toJson<String?>(status),
    };
  }

  SeriesEntry copyWith({
    int? id,
    Value<bool?> adult = const Value.absent(),
    Value<String?> backdropPath = const Value.absent(),
    Value<String?> genreIds = const Value.absent(),
    Value<String?> originalLanguage = const Value.absent(),
    Value<String?> originalName = const Value.absent(),
    Value<String?> overview = const Value.absent(),
    Value<double?> popularity = const Value.absent(),
    Value<String?> posterPath = const Value.absent(),
    Value<DateTime?> firstAirDate = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<double?> voteAverage = const Value.absent(),
    Value<int?> voteCount = const Value.absent(),
    Value<int?> numberOfSeasons = const Value.absent(),
    Value<int?> numberOfEpisodes = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => SeriesEntry(
    id: id ?? this.id,
    adult: adult.present ? adult.value : this.adult,
    backdropPath: backdropPath.present ? backdropPath.value : this.backdropPath,
    genreIds: genreIds.present ? genreIds.value : this.genreIds,
    originalLanguage: originalLanguage.present
        ? originalLanguage.value
        : this.originalLanguage,
    originalName: originalName.present ? originalName.value : this.originalName,
    overview: overview.present ? overview.value : this.overview,
    popularity: popularity.present ? popularity.value : this.popularity,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
    firstAirDate: firstAirDate.present ? firstAirDate.value : this.firstAirDate,
    name: name.present ? name.value : this.name,
    voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
    voteCount: voteCount.present ? voteCount.value : this.voteCount,
    numberOfSeasons: numberOfSeasons.present
        ? numberOfSeasons.value
        : this.numberOfSeasons,
    numberOfEpisodes: numberOfEpisodes.present
        ? numberOfEpisodes.value
        : this.numberOfEpisodes,
    status: status.present ? status.value : this.status,
  );
  SeriesEntry copyWithCompanion(SeriesTableCompanion data) {
    return SeriesEntry(
      id: data.id.present ? data.id.value : this.id,
      adult: data.adult.present ? data.adult.value : this.adult,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      genreIds: data.genreIds.present ? data.genreIds.value : this.genreIds,
      originalLanguage: data.originalLanguage.present
          ? data.originalLanguage.value
          : this.originalLanguage,
      originalName: data.originalName.present
          ? data.originalName.value
          : this.originalName,
      overview: data.overview.present ? data.overview.value : this.overview,
      popularity: data.popularity.present
          ? data.popularity.value
          : this.popularity,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
      firstAirDate: data.firstAirDate.present
          ? data.firstAirDate.value
          : this.firstAirDate,
      name: data.name.present ? data.name.value : this.name,
      voteAverage: data.voteAverage.present
          ? data.voteAverage.value
          : this.voteAverage,
      voteCount: data.voteCount.present ? data.voteCount.value : this.voteCount,
      numberOfSeasons: data.numberOfSeasons.present
          ? data.numberOfSeasons.value
          : this.numberOfSeasons,
      numberOfEpisodes: data.numberOfEpisodes.present
          ? data.numberOfEpisodes.value
          : this.numberOfEpisodes,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeriesEntry(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('genreIds: $genreIds, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalName: $originalName, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('name: $name, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('numberOfSeasons: $numberOfSeasons, ')
          ..write('numberOfEpisodes: $numberOfEpisodes, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    adult,
    backdropPath,
    genreIds,
    originalLanguage,
    originalName,
    overview,
    popularity,
    posterPath,
    firstAirDate,
    name,
    voteAverage,
    voteCount,
    numberOfSeasons,
    numberOfEpisodes,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeriesEntry &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.genreIds == this.genreIds &&
          other.originalLanguage == this.originalLanguage &&
          other.originalName == this.originalName &&
          other.overview == this.overview &&
          other.popularity == this.popularity &&
          other.posterPath == this.posterPath &&
          other.firstAirDate == this.firstAirDate &&
          other.name == this.name &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount &&
          other.numberOfSeasons == this.numberOfSeasons &&
          other.numberOfEpisodes == this.numberOfEpisodes &&
          other.status == this.status);
}

class SeriesTableCompanion extends UpdateCompanion<SeriesEntry> {
  final Value<int> id;
  final Value<bool?> adult;
  final Value<String?> backdropPath;
  final Value<String?> genreIds;
  final Value<String?> originalLanguage;
  final Value<String?> originalName;
  final Value<String?> overview;
  final Value<double?> popularity;
  final Value<String?> posterPath;
  final Value<DateTime?> firstAirDate;
  final Value<String?> name;
  final Value<double?> voteAverage;
  final Value<int?> voteCount;
  final Value<int?> numberOfSeasons;
  final Value<int?> numberOfEpisodes;
  final Value<String?> status;
  const SeriesTableCompanion({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalName = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.firstAirDate = const Value.absent(),
    this.name = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.numberOfSeasons = const Value.absent(),
    this.numberOfEpisodes = const Value.absent(),
    this.status = const Value.absent(),
  });
  SeriesTableCompanion.insert({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalName = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.firstAirDate = const Value.absent(),
    this.name = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.numberOfSeasons = const Value.absent(),
    this.numberOfEpisodes = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<SeriesEntry> custom({
    Expression<int>? id,
    Expression<bool>? adult,
    Expression<String>? backdropPath,
    Expression<String>? genreIds,
    Expression<String>? originalLanguage,
    Expression<String>? originalName,
    Expression<String>? overview,
    Expression<double>? popularity,
    Expression<String>? posterPath,
    Expression<DateTime>? firstAirDate,
    Expression<String>? name,
    Expression<double>? voteAverage,
    Expression<int>? voteCount,
    Expression<int>? numberOfSeasons,
    Expression<int>? numberOfEpisodes,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (genreIds != null) 'genre_ids': genreIds,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalName != null) 'original_name': originalName,
      if (overview != null) 'overview': overview,
      if (popularity != null) 'popularity': popularity,
      if (posterPath != null) 'poster_path': posterPath,
      if (firstAirDate != null) 'first_air_date': firstAirDate,
      if (name != null) 'name': name,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
      if (numberOfSeasons != null) 'number_of_seasons': numberOfSeasons,
      if (numberOfEpisodes != null) 'number_of_episodes': numberOfEpisodes,
      if (status != null) 'status': status,
    });
  }

  SeriesTableCompanion copyWith({
    Value<int>? id,
    Value<bool?>? adult,
    Value<String?>? backdropPath,
    Value<String?>? genreIds,
    Value<String?>? originalLanguage,
    Value<String?>? originalName,
    Value<String?>? overview,
    Value<double?>? popularity,
    Value<String?>? posterPath,
    Value<DateTime?>? firstAirDate,
    Value<String?>? name,
    Value<double?>? voteAverage,
    Value<int?>? voteCount,
    Value<int?>? numberOfSeasons,
    Value<int?>? numberOfEpisodes,
    Value<String?>? status,
  }) {
    return SeriesTableCompanion(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      name: name ?? this.name,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (genreIds.present) {
      map['genre_ids'] = Variable<String>(genreIds.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (originalName.present) {
      map['original_name'] = Variable<String>(originalName.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (firstAirDate.present) {
      map['first_air_date'] = Variable<DateTime>(firstAirDate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (numberOfSeasons.present) {
      map['number_of_seasons'] = Variable<int>(numberOfSeasons.value);
    }
    if (numberOfEpisodes.present) {
      map['number_of_episodes'] = Variable<int>(numberOfEpisodes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesTableCompanion(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('genreIds: $genreIds, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalName: $originalName, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('name: $name, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount, ')
          ..write('numberOfSeasons: $numberOfSeasons, ')
          ..write('numberOfEpisodes: $numberOfEpisodes, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MoviesTableTable moviesTable = $MoviesTableTable(this);
  late final $SeriesTableTable seriesTable = $SeriesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    moviesTable,
    seriesTable,
  ];
}

typedef $$MoviesTableTableCreateCompanionBuilder =
    MoviesTableCompanion Function({
      Value<int> id,
      Value<bool?> adult,
      Value<String?> backdropPath,
      Value<String?> genreIds,
      Value<String?> originalLanguage,
      Value<String?> originalTitle,
      Value<String?> overview,
      Value<double?> popularity,
      Value<String?> posterPath,
      Value<DateTime?> releaseDate,
      Value<String?> title,
      Value<bool?> video,
      Value<double?> voteAverage,
      Value<int?> voteCount,
      Value<int?> budget,
      Value<int?> revenue,
      Value<int?> runtime,
      Value<String?> heroId,
    });
typedef $$MoviesTableTableUpdateCompanionBuilder =
    MoviesTableCompanion Function({
      Value<int> id,
      Value<bool?> adult,
      Value<String?> backdropPath,
      Value<String?> genreIds,
      Value<String?> originalLanguage,
      Value<String?> originalTitle,
      Value<String?> overview,
      Value<double?> popularity,
      Value<String?> posterPath,
      Value<DateTime?> releaseDate,
      Value<String?> title,
      Value<bool?> video,
      Value<double?> voteAverage,
      Value<int?> voteCount,
      Value<int?> budget,
      Value<int?> revenue,
      Value<int?> runtime,
      Value<String?> heroId,
    });

class $$MoviesTableTableFilterComposer
    extends Composer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get adult => $composableBuilder(
    column: $table.adult,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genreIds => $composableBuilder(
    column: $table.genreIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get popularity => $composableBuilder(
    column: $table.popularity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get video => $composableBuilder(
    column: $table.video,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voteCount => $composableBuilder(
    column: $table.voteCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revenue => $composableBuilder(
    column: $table.revenue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get runtime => $composableBuilder(
    column: $table.runtime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get heroId => $composableBuilder(
    column: $table.heroId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MoviesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get adult => $composableBuilder(
    column: $table.adult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genreIds => $composableBuilder(
    column: $table.genreIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get popularity => $composableBuilder(
    column: $table.popularity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get video => $composableBuilder(
    column: $table.video,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voteCount => $composableBuilder(
    column: $table.voteCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revenue => $composableBuilder(
    column: $table.revenue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get runtime => $composableBuilder(
    column: $table.runtime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get heroId => $composableBuilder(
    column: $table.heroId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MoviesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MoviesTableTable> {
  $$MoviesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get adult =>
      $composableBuilder(column: $table.adult, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get genreIds =>
      $composableBuilder(column: $table.genreIds, builder: (column) => column);

  GeneratedColumn<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalTitle => $composableBuilder(
    column: $table.originalTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<double> get popularity => $composableBuilder(
    column: $table.popularity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get video =>
      $composableBuilder(column: $table.video, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get voteCount =>
      $composableBuilder(column: $table.voteCount, builder: (column) => column);

  GeneratedColumn<int> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<int> get revenue =>
      $composableBuilder(column: $table.revenue, builder: (column) => column);

  GeneratedColumn<int> get runtime =>
      $composableBuilder(column: $table.runtime, builder: (column) => column);

  GeneratedColumn<String> get heroId =>
      $composableBuilder(column: $table.heroId, builder: (column) => column);
}

class $$MoviesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MoviesTableTable,
          MovieEntry,
          $$MoviesTableTableFilterComposer,
          $$MoviesTableTableOrderingComposer,
          $$MoviesTableTableAnnotationComposer,
          $$MoviesTableTableCreateCompanionBuilder,
          $$MoviesTableTableUpdateCompanionBuilder,
          (
            MovieEntry,
            BaseReferences<_$AppDatabase, $MoviesTableTable, MovieEntry>,
          ),
          MovieEntry,
          PrefetchHooks Function()
        > {
  $$MoviesTableTableTableManager(_$AppDatabase db, $MoviesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoviesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoviesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoviesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> adult = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<String?> genreIds = const Value.absent(),
                Value<String?> originalLanguage = const Value.absent(),
                Value<String?> originalTitle = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<double?> popularity = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<DateTime?> releaseDate = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<bool?> video = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<int?> voteCount = const Value.absent(),
                Value<int?> budget = const Value.absent(),
                Value<int?> revenue = const Value.absent(),
                Value<int?> runtime = const Value.absent(),
                Value<String?> heroId = const Value.absent(),
              }) => MoviesTableCompanion(
                id: id,
                adult: adult,
                backdropPath: backdropPath,
                genreIds: genreIds,
                originalLanguage: originalLanguage,
                originalTitle: originalTitle,
                overview: overview,
                popularity: popularity,
                posterPath: posterPath,
                releaseDate: releaseDate,
                title: title,
                video: video,
                voteAverage: voteAverage,
                voteCount: voteCount,
                budget: budget,
                revenue: revenue,
                runtime: runtime,
                heroId: heroId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> adult = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<String?> genreIds = const Value.absent(),
                Value<String?> originalLanguage = const Value.absent(),
                Value<String?> originalTitle = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<double?> popularity = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<DateTime?> releaseDate = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<bool?> video = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<int?> voteCount = const Value.absent(),
                Value<int?> budget = const Value.absent(),
                Value<int?> revenue = const Value.absent(),
                Value<int?> runtime = const Value.absent(),
                Value<String?> heroId = const Value.absent(),
              }) => MoviesTableCompanion.insert(
                id: id,
                adult: adult,
                backdropPath: backdropPath,
                genreIds: genreIds,
                originalLanguage: originalLanguage,
                originalTitle: originalTitle,
                overview: overview,
                popularity: popularity,
                posterPath: posterPath,
                releaseDate: releaseDate,
                title: title,
                video: video,
                voteAverage: voteAverage,
                voteCount: voteCount,
                budget: budget,
                revenue: revenue,
                runtime: runtime,
                heroId: heroId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MoviesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MoviesTableTable,
      MovieEntry,
      $$MoviesTableTableFilterComposer,
      $$MoviesTableTableOrderingComposer,
      $$MoviesTableTableAnnotationComposer,
      $$MoviesTableTableCreateCompanionBuilder,
      $$MoviesTableTableUpdateCompanionBuilder,
      (
        MovieEntry,
        BaseReferences<_$AppDatabase, $MoviesTableTable, MovieEntry>,
      ),
      MovieEntry,
      PrefetchHooks Function()
    >;
typedef $$SeriesTableTableCreateCompanionBuilder =
    SeriesTableCompanion Function({
      Value<int> id,
      Value<bool?> adult,
      Value<String?> backdropPath,
      Value<String?> genreIds,
      Value<String?> originalLanguage,
      Value<String?> originalName,
      Value<String?> overview,
      Value<double?> popularity,
      Value<String?> posterPath,
      Value<DateTime?> firstAirDate,
      Value<String?> name,
      Value<double?> voteAverage,
      Value<int?> voteCount,
      Value<int?> numberOfSeasons,
      Value<int?> numberOfEpisodes,
      Value<String?> status,
    });
typedef $$SeriesTableTableUpdateCompanionBuilder =
    SeriesTableCompanion Function({
      Value<int> id,
      Value<bool?> adult,
      Value<String?> backdropPath,
      Value<String?> genreIds,
      Value<String?> originalLanguage,
      Value<String?> originalName,
      Value<String?> overview,
      Value<double?> popularity,
      Value<String?> posterPath,
      Value<DateTime?> firstAirDate,
      Value<String?> name,
      Value<double?> voteAverage,
      Value<int?> voteCount,
      Value<int?> numberOfSeasons,
      Value<int?> numberOfEpisodes,
      Value<String?> status,
    });

class $$SeriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get adult => $composableBuilder(
    column: $table.adult,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genreIds => $composableBuilder(
    column: $table.genreIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get popularity => $composableBuilder(
    column: $table.popularity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get firstAirDate => $composableBuilder(
    column: $table.firstAirDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voteCount => $composableBuilder(
    column: $table.voteCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfSeasons => $composableBuilder(
    column: $table.numberOfSeasons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfEpisodes => $composableBuilder(
    column: $table.numberOfEpisodes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SeriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get adult => $composableBuilder(
    column: $table.adult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genreIds => $composableBuilder(
    column: $table.genreIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get popularity => $composableBuilder(
    column: $table.popularity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get firstAirDate => $composableBuilder(
    column: $table.firstAirDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voteCount => $composableBuilder(
    column: $table.voteCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfSeasons => $composableBuilder(
    column: $table.numberOfSeasons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfEpisodes => $composableBuilder(
    column: $table.numberOfEpisodes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeriesTableTable> {
  $$SeriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get adult =>
      $composableBuilder(column: $table.adult, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get genreIds =>
      $composableBuilder(column: $table.genreIds, builder: (column) => column);

  GeneratedColumn<String> get originalLanguage => $composableBuilder(
    column: $table.originalLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<double> get popularity => $composableBuilder(
    column: $table.popularity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get firstAirDate => $composableBuilder(
    column: $table.firstAirDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get voteCount =>
      $composableBuilder(column: $table.voteCount, builder: (column) => column);

  GeneratedColumn<int> get numberOfSeasons => $composableBuilder(
    column: $table.numberOfSeasons,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfEpisodes => $composableBuilder(
    column: $table.numberOfEpisodes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SeriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeriesTableTable,
          SeriesEntry,
          $$SeriesTableTableFilterComposer,
          $$SeriesTableTableOrderingComposer,
          $$SeriesTableTableAnnotationComposer,
          $$SeriesTableTableCreateCompanionBuilder,
          $$SeriesTableTableUpdateCompanionBuilder,
          (
            SeriesEntry,
            BaseReferences<_$AppDatabase, $SeriesTableTable, SeriesEntry>,
          ),
          SeriesEntry,
          PrefetchHooks Function()
        > {
  $$SeriesTableTableTableManager(_$AppDatabase db, $SeriesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> adult = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<String?> genreIds = const Value.absent(),
                Value<String?> originalLanguage = const Value.absent(),
                Value<String?> originalName = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<double?> popularity = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<DateTime?> firstAirDate = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<int?> voteCount = const Value.absent(),
                Value<int?> numberOfSeasons = const Value.absent(),
                Value<int?> numberOfEpisodes = const Value.absent(),
                Value<String?> status = const Value.absent(),
              }) => SeriesTableCompanion(
                id: id,
                adult: adult,
                backdropPath: backdropPath,
                genreIds: genreIds,
                originalLanguage: originalLanguage,
                originalName: originalName,
                overview: overview,
                popularity: popularity,
                posterPath: posterPath,
                firstAirDate: firstAirDate,
                name: name,
                voteAverage: voteAverage,
                voteCount: voteCount,
                numberOfSeasons: numberOfSeasons,
                numberOfEpisodes: numberOfEpisodes,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool?> adult = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<String?> genreIds = const Value.absent(),
                Value<String?> originalLanguage = const Value.absent(),
                Value<String?> originalName = const Value.absent(),
                Value<String?> overview = const Value.absent(),
                Value<double?> popularity = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<DateTime?> firstAirDate = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<int?> voteCount = const Value.absent(),
                Value<int?> numberOfSeasons = const Value.absent(),
                Value<int?> numberOfEpisodes = const Value.absent(),
                Value<String?> status = const Value.absent(),
              }) => SeriesTableCompanion.insert(
                id: id,
                adult: adult,
                backdropPath: backdropPath,
                genreIds: genreIds,
                originalLanguage: originalLanguage,
                originalName: originalName,
                overview: overview,
                popularity: popularity,
                posterPath: posterPath,
                firstAirDate: firstAirDate,
                name: name,
                voteAverage: voteAverage,
                voteCount: voteCount,
                numberOfSeasons: numberOfSeasons,
                numberOfEpisodes: numberOfEpisodes,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SeriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeriesTableTable,
      SeriesEntry,
      $$SeriesTableTableFilterComposer,
      $$SeriesTableTableOrderingComposer,
      $$SeriesTableTableAnnotationComposer,
      $$SeriesTableTableCreateCompanionBuilder,
      $$SeriesTableTableUpdateCompanionBuilder,
      (
        SeriesEntry,
        BaseReferences<_$AppDatabase, $SeriesTableTable, SeriesEntry>,
      ),
      SeriesEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MoviesTableTableTableManager get moviesTable =>
      $$MoviesTableTableTableManager(_db, _db.moviesTable);
  $$SeriesTableTableTableManager get seriesTable =>
      $$SeriesTableTableTableManager(_db, _db.seriesTable);
}
