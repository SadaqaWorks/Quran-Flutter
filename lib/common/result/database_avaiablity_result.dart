import 'package:quran_reader/common/result/repository_result.dart';

class DatabaseNotAvailableResult extends RepositoryResult {
  final String message;

  DatabaseNotAvailableResult(this.message) : super(message: message);
}
