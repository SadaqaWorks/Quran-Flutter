import 'package:moor/moor.dart';

part 'database.g.dart';

class EasyDatabase extends _$EasyDatabase {
  // we tell the database where to store the data with this constructor
  EasyDatabase(QueryExecutor e) : super(e);

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}
