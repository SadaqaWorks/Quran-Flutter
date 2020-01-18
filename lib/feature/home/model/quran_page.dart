import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class QuranPage extends Equatable {
  final int page;
  final String imageUrl;

  @required
  QuranPage({this.page, this.imageUrl});

  // String get imageUrl => 'assets/images/quran/image$page.png';

  // Equatable
  @override
  List<Object> get props => [page, imageUrl];
}
