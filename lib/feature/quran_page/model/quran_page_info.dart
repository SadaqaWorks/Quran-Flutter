import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'quran_page_info.g.dart';

@JsonSerializable()
class QuranPageInfo extends Equatable {
  @JsonKey(name: 'page_number')
  final int pageNumber;
  @JsonKey(name: 'line_number')
  final int? lineNumber;
  @JsonKey(name: 'sura_number')
  final int? suraNumber;
  @JsonKey(name: 'ayah_number')
  final int? ayahNumber;
  final int? position;
  @JsonKey(name: 'min_x')
  final int? minX;
  @JsonKey(name: 'min_y')
  final int? minY;
  @JsonKey(name: 'max_x')
  final int? maxX;
  @JsonKey(name: 'max_y')
  final int? maxY;
  final String? name;
  @JsonKey(name: 'name_arabic')
  final String? nameArabic;

  @required
  QuranPageInfo(
      {required this.pageNumber,
      this.lineNumber,
      this.suraNumber,
      this.ayahNumber,
      this.position,
      this.minX,
      this.minY,
      this.maxX,
      this.maxY,
      this.name,
      this.nameArabic});

  // Equatable
  @override
  List<Object?> get props => [
        pageNumber,
        lineNumber,
        suraNumber,
        ayahNumber,
        position,
        minX,
        minY,
        maxX,
        maxY,
        name,
        nameArabic
      ];

  // json encoding decoding
  factory QuranPageInfo.fromJson(Map<String, dynamic> json) =>
      _$QuranPageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageInfoToJson(this);
}
