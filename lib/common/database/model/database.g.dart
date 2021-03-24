part of 'database.dart';

abstract class _$EasyDatabase extends GeneratedDatabase {
  _$EasyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
}
