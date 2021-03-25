import 'package:quran_reader/common/result/repository_result.dart';

class APIErrorResult extends RepositoryResult {
  final String message;

  APIErrorResult(this.message) : super(message: message);
}
