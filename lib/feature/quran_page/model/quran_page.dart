import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/common/quran/model/sura_verses.dart';

part 'quran_page.freezed.dart';
part 'quran_page.g.dart';

@freezed
class QuranPage with _$QuranPage {
  const QuranPage._();
  const factory QuranPage(int pageNumber, ImageFile imageFile,
      {List<SuraVerses>? suraVerses}) = _QuranPage;

  factory QuranPage.fromJson(Map<String, dynamic> json) =>
      _$QuranPageFromJson(json);
}

@freezed
class ImageFile with _$ImageFile {

  const ImageFile._();
  const factory ImageFile(String imageUrl, ImageLoadPolicy loadPolicy) =
      _ImageFile;

  factory ImageFile.fromJson(Map<String, dynamic> json) =>
      _$ImageFileFromJson(json);
}

enum ImageLoadPolicy { cache, network }
