// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quran_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuranPage _$QuranPageFromJson(Map<String, dynamic> json) {
  return _QuranPage.fromJson(json);
}

/// @nodoc
class _$QuranPageTearOff {
  const _$QuranPageTearOff();

  _QuranPage call(int pageNumber, ImageFile imageFile,
      {List<SuraVerses>? suraVerses}) {
    return _QuranPage(
      pageNumber,
      imageFile,
      suraVerses: suraVerses,
    );
  }

  QuranPage fromJson(Map<String, Object> json) {
    return QuranPage.fromJson(json);
  }
}

/// @nodoc
const $QuranPage = _$QuranPageTearOff();

/// @nodoc
mixin _$QuranPage {
  int get pageNumber => throw _privateConstructorUsedError;
  ImageFile get imageFile => throw _privateConstructorUsedError;
  List<SuraVerses>? get suraVerses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuranPageCopyWith<QuranPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranPageCopyWith<$Res> {
  factory $QuranPageCopyWith(QuranPage value, $Res Function(QuranPage) then) =
      _$QuranPageCopyWithImpl<$Res>;
  $Res call(
      {int pageNumber, ImageFile imageFile, List<SuraVerses>? suraVerses});

  $ImageFileCopyWith<$Res> get imageFile;
}

/// @nodoc
class _$QuranPageCopyWithImpl<$Res> implements $QuranPageCopyWith<$Res> {
  _$QuranPageCopyWithImpl(this._value, this._then);

  final QuranPage _value;
  // ignore: unused_field
  final $Res Function(QuranPage) _then;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? imageFile = freezed,
    Object? suraVerses = freezed,
  }) {
    return _then(_value.copyWith(
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as ImageFile,
      suraVerses: suraVerses == freezed
          ? _value.suraVerses
          : suraVerses // ignore: cast_nullable_to_non_nullable
              as List<SuraVerses>?,
    ));
  }

  @override
  $ImageFileCopyWith<$Res> get imageFile {
    return $ImageFileCopyWith<$Res>(_value.imageFile, (value) {
      return _then(_value.copyWith(imageFile: value));
    });
  }
}

/// @nodoc
abstract class _$QuranPageCopyWith<$Res> implements $QuranPageCopyWith<$Res> {
  factory _$QuranPageCopyWith(
          _QuranPage value, $Res Function(_QuranPage) then) =
      __$QuranPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {int pageNumber, ImageFile imageFile, List<SuraVerses>? suraVerses});

  @override
  $ImageFileCopyWith<$Res> get imageFile;
}

/// @nodoc
class __$QuranPageCopyWithImpl<$Res> extends _$QuranPageCopyWithImpl<$Res>
    implements _$QuranPageCopyWith<$Res> {
  __$QuranPageCopyWithImpl(_QuranPage _value, $Res Function(_QuranPage) _then)
      : super(_value, (v) => _then(v as _QuranPage));

  @override
  _QuranPage get _value => super._value as _QuranPage;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? imageFile = freezed,
    Object? suraVerses = freezed,
  }) {
    return _then(_QuranPage(
      pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as ImageFile,
      suraVerses: suraVerses == freezed
          ? _value.suraVerses
          : suraVerses // ignore: cast_nullable_to_non_nullable
              as List<SuraVerses>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_QuranPage extends _QuranPage {
  const _$_QuranPage(this.pageNumber, this.imageFile, {this.suraVerses})
      : super._();

  factory _$_QuranPage.fromJson(Map<String, dynamic> json) =>
      _$_$_QuranPageFromJson(json);

  @override
  final int pageNumber;
  @override
  final ImageFile imageFile;
  @override
  final List<SuraVerses>? suraVerses;

  @override
  String toString() {
    return 'QuranPage(pageNumber: $pageNumber, imageFile: $imageFile, suraVerses: $suraVerses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuranPage &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.suraVerses, suraVerses) ||
                const DeepCollectionEquality()
                    .equals(other.suraVerses, suraVerses)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(suraVerses);

  @JsonKey(ignore: true)
  @override
  _$QuranPageCopyWith<_QuranPage> get copyWith =>
      __$QuranPageCopyWithImpl<_QuranPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuranPageToJson(this);
  }
}

abstract class _QuranPage extends QuranPage {
  const factory _QuranPage(int pageNumber, ImageFile imageFile,
      {List<SuraVerses>? suraVerses}) = _$_QuranPage;
  const _QuranPage._() : super._();

  factory _QuranPage.fromJson(Map<String, dynamic> json) =
      _$_QuranPage.fromJson;

  @override
  int get pageNumber => throw _privateConstructorUsedError;
  @override
  ImageFile get imageFile => throw _privateConstructorUsedError;
  @override
  List<SuraVerses>? get suraVerses => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuranPageCopyWith<_QuranPage> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageFile _$ImageFileFromJson(Map<String, dynamic> json) {
  return _ImageFile.fromJson(json);
}

/// @nodoc
class _$ImageFileTearOff {
  const _$ImageFileTearOff();

  _ImageFile call(String imageUrl, ImageLoadPolicy loadPolicy) {
    return _ImageFile(
      imageUrl,
      loadPolicy,
    );
  }

  ImageFile fromJson(Map<String, Object> json) {
    return ImageFile.fromJson(json);
  }
}

/// @nodoc
const $ImageFile = _$ImageFileTearOff();

/// @nodoc
mixin _$ImageFile {
  String get imageUrl => throw _privateConstructorUsedError;
  ImageLoadPolicy get loadPolicy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageFileCopyWith<ImageFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageFileCopyWith<$Res> {
  factory $ImageFileCopyWith(ImageFile value, $Res Function(ImageFile) then) =
      _$ImageFileCopyWithImpl<$Res>;
  $Res call({String imageUrl, ImageLoadPolicy loadPolicy});
}

/// @nodoc
class _$ImageFileCopyWithImpl<$Res> implements $ImageFileCopyWith<$Res> {
  _$ImageFileCopyWithImpl(this._value, this._then);

  final ImageFile _value;
  // ignore: unused_field
  final $Res Function(ImageFile) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? loadPolicy = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      loadPolicy: loadPolicy == freezed
          ? _value.loadPolicy
          : loadPolicy // ignore: cast_nullable_to_non_nullable
              as ImageLoadPolicy,
    ));
  }
}

/// @nodoc
abstract class _$ImageFileCopyWith<$Res> implements $ImageFileCopyWith<$Res> {
  factory _$ImageFileCopyWith(
          _ImageFile value, $Res Function(_ImageFile) then) =
      __$ImageFileCopyWithImpl<$Res>;
  @override
  $Res call({String imageUrl, ImageLoadPolicy loadPolicy});
}

/// @nodoc
class __$ImageFileCopyWithImpl<$Res> extends _$ImageFileCopyWithImpl<$Res>
    implements _$ImageFileCopyWith<$Res> {
  __$ImageFileCopyWithImpl(_ImageFile _value, $Res Function(_ImageFile) _then)
      : super(_value, (v) => _then(v as _ImageFile));

  @override
  _ImageFile get _value => super._value as _ImageFile;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? loadPolicy = freezed,
  }) {
    return _then(_ImageFile(
      imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      loadPolicy == freezed
          ? _value.loadPolicy
          : loadPolicy // ignore: cast_nullable_to_non_nullable
              as ImageLoadPolicy,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ImageFile extends _ImageFile {
  const _$_ImageFile(this.imageUrl, this.loadPolicy) : super._();

  factory _$_ImageFile.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageFileFromJson(json);

  @override
  final String imageUrl;
  @override
  final ImageLoadPolicy loadPolicy;

  @override
  String toString() {
    return 'ImageFile(imageUrl: $imageUrl, loadPolicy: $loadPolicy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageFile &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.loadPolicy, loadPolicy) ||
                const DeepCollectionEquality()
                    .equals(other.loadPolicy, loadPolicy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(loadPolicy);

  @JsonKey(ignore: true)
  @override
  _$ImageFileCopyWith<_ImageFile> get copyWith =>
      __$ImageFileCopyWithImpl<_ImageFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageFileToJson(this);
  }
}

abstract class _ImageFile extends ImageFile {
  const factory _ImageFile(String imageUrl, ImageLoadPolicy loadPolicy) =
      _$_ImageFile;
  const _ImageFile._() : super._();

  factory _ImageFile.fromJson(Map<String, dynamic> json) =
      _$_ImageFile.fromJson;

  @override
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  ImageLoadPolicy get loadPolicy => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageFileCopyWith<_ImageFile> get copyWith =>
      throw _privateConstructorUsedError;
}
