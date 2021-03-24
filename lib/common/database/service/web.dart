import 'package:moor/moor_web.dart';
import 'package:quran_reader/common/database/model/database.dart';
import 'package:quran_reader/common/database/model/database_file.dart';

//TODO:- I dont think currently it will work this way
EasyDatabase constructDb(
    {required DatabaseFile databaseFile, bool logStatements = false}) {
  return EasyDatabase(WebDatabase(DatabaseFile.databaseFiles.first.name,
      logStatements: logStatements));
}
