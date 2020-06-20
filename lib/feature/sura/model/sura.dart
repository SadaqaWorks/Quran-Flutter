import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sura.g.dart';

class Sura extends Equatable {
  int suraNumber;
  final String nameArabic;
  final String name;

  @required
  Sura(
      {@required this.suraNumber,
      @required this.nameArabic,
      @required this.name});

  //Equatable
  @override
  List<Object> get props => [suraNumber, nameArabic, name];

  //json encoding decoding
  factory Sura.fromJson(Map<String, dynamic> json) => _$SuraFromJson(json);

  Map<String, dynamic> toJson() => _$SuraToJson(this);
}
