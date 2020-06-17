import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'quran_page_info.dart';

part 'quran_page.g.dart';

class QuranPage extends Equatable {
  int page;
  final String imageUrl;
  List<QuranPageInfo> quranPageInfoList;

  @required
  QuranPage(
      {@required this.page, @required this.imageUrl, this.quranPageInfoList});

  //Equatable
  @override
  List<Object> get props => [page, imageUrl, quranPageInfoList];

  //json encoding decoding
  factory QuranPage.fromJson(Map<String, dynamic> json) =>
      _$QuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageToJson(this);
}
