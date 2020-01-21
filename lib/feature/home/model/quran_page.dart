import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quran_page.g.dart';

class QuranPage extends Equatable {
  final int page;
  final String imageUrl;

  @required
  QuranPage({this.page, this.imageUrl});

  // Equatable
  @override
  List<Object> get props => [page, imageUrl];

  // json encoding decoding
  factory QuranPage.fromJson(Map<String, dynamic> json) =>
      _$QuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageToJson(this);
}
