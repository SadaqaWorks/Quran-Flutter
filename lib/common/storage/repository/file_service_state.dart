import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'file_service_state.freezed.dart';

@freezed
class FileServiceState with _$FileState {
  const factory FileServiceState.available(Database database) = _Available;
  const factory FileServiceState.notAvailable() = _NotAvailable;
}
