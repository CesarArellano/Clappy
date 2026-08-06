import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('MovieEntry')
class MoviesTable extends Table {
  @override
  String get tableName => 'movies';

  IntColumn get id => integer()();
  BoolColumn get adult => boolean().nullable()();
  TextColumn get backdropPath => text().nullable()();
  TextColumn get genreIds => text().nullable()();
  TextColumn get originalLanguage => text().nullable()();
  TextColumn get originalTitle => text().nullable()();
  TextColumn get overview => text().nullable()();
  RealColumn get popularity => real().nullable()();
  TextColumn get posterPath => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  TextColumn get title => text().nullable()();
  BoolColumn get video => boolean().nullable()();
  RealColumn get voteAverage => real().nullable()();
  IntColumn get voteCount => integer().nullable()();
  IntColumn get budget => integer().nullable()();
  IntColumn get revenue => integer().nullable()();
  IntColumn get runtime => integer().nullable()();
  TextColumn get heroId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SeriesEntry')
class SeriesTable extends Table {
  @override
  String get tableName => 'series';

  IntColumn get id => integer()();
  BoolColumn get adult => boolean().nullable()();
  TextColumn get backdropPath => text().nullable()();
  TextColumn get genreIds => text().nullable()();
  TextColumn get originalLanguage => text().nullable()();
  TextColumn get originalName => text().nullable()();
  TextColumn get overview => text().nullable()();
  RealColumn get popularity => real().nullable()();
  TextColumn get posterPath => text().nullable()();
  DateTimeColumn get firstAirDate => dateTime().nullable()();
  TextColumn get name => text().nullable()();
  RealColumn get voteAverage => real().nullable()();
  IntColumn get voteCount => integer().nullable()();
  IntColumn get numberOfSeasons => integer().nullable()();
  IntColumn get numberOfEpisodes => integer().nullable()();
  TextColumn get status => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [MoviesTable, SeriesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(seriesTable);
      }
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'clappy');
  }
}
