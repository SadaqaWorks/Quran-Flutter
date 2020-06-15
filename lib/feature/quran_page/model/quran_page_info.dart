import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quran_page_info.g.dart';

class QuranPageInfo extends Equatable {
  final int pageNumber;
  final int lineNumber;
  final int suraNumber;
  final int ayahNumber;
  final int position;
  final int minX;
  final int minY;
  final int maxX;
  final int maxY;
  final String nameEnglish;

  @required
  QuranPageInfo(
      {this.pageNumber,
      this.lineNumber,
      this.suraNumber,
      this.ayahNumber,
      this.position,
      this.minX,
      this.minY,
      this.maxX,
      this.maxY,
      this.nameEnglish});

  // Equatable
  @override
  List<Object> get props => [
        pageNumber,
        lineNumber,
        suraNumber,
        ayahNumber,
        position,
        minX,
        minY,
        maxX,
        maxY,
        nameEnglish
      ];

  // json encoding decoding
  factory QuranPageInfo.fromJson(Map<String, dynamic> json) =>
      _$QuranPageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageInfoToJson(this);
}
