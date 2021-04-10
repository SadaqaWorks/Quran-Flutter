import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:quran_reader/common/quran/model/sura_verses.dart';

import 'quran_page_info.dart';

part 'quran_page.g.dart';

@JsonSerializable()
class QuranPage extends Equatable {
  int pageNumber;
  final String? imageUrl;
  List<SuraVerses>? suraVerses;

  @required
  QuranPage({required this.pageNumber, this.imageUrl, this.suraVerses});

  //Equatable
  @override
  List<Object?> get props => [pageNumber, imageUrl, suraVerses];

  //json encoding decoding
  factory QuranPage.fromJson(Map<String, dynamic> json) =>
      _$QuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageToJson(this);
}
