// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return _Resource.fromJson(json);
}

/// @nodoc
class _$ResourceTearOff {
  const _$ResourceTearOff();

  _Resource call(
      {@HiveField(0) required int id,
      @HiveField(1) required String name,
      @HiveField(2) required String url,
      @HiveField(3) required bool required,
      @HiveField(4) required ResourceType resourceType,
      @HiveField(5) required FileType fileType,
      @HiveField(6) required int version,
      @HiveField(7) required bool needRefresh,
      @HiveField(8) required bool downloaded,
      @HiveField(9) required bool bundled,
      @HiveField(10) String? description}) {
    return _Resource(
      id: id,
      name: name,
      url: url,
      required: required,
      resourceType: resourceType,
      fileType: fileType,
      version: version,
      needRefresh: needRefresh,
      downloaded: downloaded,
      bundled: bundled,
      description: description,
    );
  }

  Resource fromJson(Map<String, Object> json) {
    return Resource.fromJson(json);
  }
}

/// @nodoc
const $Resource = _$ResourceTearOff();

/// @nodoc
mixin _$Resource {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get required => throw _privateConstructorUsedError;
  @HiveField(4)
  ResourceType get resourceType => throw _privateConstructorUsedError;
  @HiveField(5)
  FileType get fileType => throw _privateConstructorUsedError;
  @HiveField(6)
  int get version => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get needRefresh => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get downloaded => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get bundled => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceCopyWith<Resource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String url,
      @HiveField(3) bool required,
      @HiveField(4) ResourceType resourceType,
      @HiveField(5) FileType fileType,
      @HiveField(6) int version,
      @HiveField(7) bool needRefresh,
      @HiveField(8) bool downloaded,
      @HiveField(9) bool bundled,
      @HiveField(10) String? description});
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res> implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  final Resource _value;
  // ignore: unused_field
  final $Res Function(Resource) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? required = freezed,
    Object? resourceType = freezed,
    Object? fileType = freezed,
    Object? version = freezed,
    Object? needRefresh = freezed,
    Object? downloaded = freezed,
    Object? bundled = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      required: required == freezed
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      needRefresh: needRefresh == freezed
          ? _value.needRefresh
          : needRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      downloaded: downloaded == freezed
          ? _value.downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as bool,
      bundled: bundled == freezed
          ? _value.bundled
          : bundled // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$ResourceCopyWith(_Resource value, $Res Function(_Resource) then) =
      __$ResourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String url,
      @HiveField(3) bool required,
      @HiveField(4) ResourceType resourceType,
      @HiveField(5) FileType fileType,
      @HiveField(6) int version,
      @HiveField(7) bool needRefresh,
      @HiveField(8) bool downloaded,
      @HiveField(9) bool bundled,
      @HiveField(10) String? description});
}

/// @nodoc
class __$ResourceCopyWithImpl<$Res> extends _$ResourceCopyWithImpl<$Res>
    implements _$ResourceCopyWith<$Res> {
  __$ResourceCopyWithImpl(_Resource _value, $Res Function(_Resource) _then)
      : super(_value, (v) => _then(v as _Resource));

  @override
  _Resource get _value => super._value as _Resource;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? required = freezed,
    Object? resourceType = freezed,
    Object? fileType = freezed,
    Object? version = freezed,
    Object? needRefresh = freezed,
    Object? downloaded = freezed,
    Object? bundled = freezed,
    Object? description = freezed,
  }) {
    return _then(_Resource(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      required: required == freezed
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      resourceType: resourceType == freezed
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      needRefresh: needRefresh == freezed
          ? _value.needRefresh
          : needRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      downloaded: downloaded == freezed
          ? _value.downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as bool,
      bundled: bundled == freezed
          ? _value.bundled
          : bundled // ignore: cast_nullable_to_non_nullable
              as bool,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()
@HiveType(typeId: 1)

/// @nodoc
class _$_Resource implements _Resource {
  const _$_Resource(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.url,
      @HiveField(3) required this.required,
      @HiveField(4) required this.resourceType,
      @HiveField(5) required this.fileType,
      @HiveField(6) required this.version,
      @HiveField(7) required this.needRefresh,
      @HiveField(8) required this.downloaded,
      @HiveField(9) required this.bundled,
      @HiveField(10) this.description});

  factory _$_Resource.fromJson(Map<String, dynamic> json) =>
      _$_$_ResourceFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String url;
  @override
  @HiveField(3)
  final bool required;
  @override
  @HiveField(4)
  final ResourceType resourceType;
  @override
  @HiveField(5)
  final FileType fileType;
  @override
  @HiveField(6)
  final int version;
  @override
  @HiveField(7)
  final bool needRefresh;
  @override
  @HiveField(8)
  final bool downloaded;
  @override
  @HiveField(9)
  final bool bundled;
  @override
  @HiveField(10)
  final String? description;

  @override
  String toString() {
    return 'Resource(id: $id, name: $name, url: $url, required: $required, resourceType: $resourceType, fileType: $fileType, version: $version, needRefresh: $needRefresh, downloaded: $downloaded, bundled: $bundled, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Resource &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.resourceType, resourceType) ||
                const DeepCollectionEquality()
                    .equals(other.resourceType, resourceType)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.needRefresh, needRefresh) ||
                const DeepCollectionEquality()
                    .equals(other.needRefresh, needRefresh)) &&
            (identical(other.downloaded, downloaded) ||
                const DeepCollectionEquality()
                    .equals(other.downloaded, downloaded)) &&
            (identical(other.bundled, bundled) ||
                const DeepCollectionEquality()
                    .equals(other.bundled, bundled)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(resourceType) ^
      const DeepCollectionEquality().hash(fileType) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(needRefresh) ^
      const DeepCollectionEquality().hash(downloaded) ^
      const DeepCollectionEquality().hash(bundled) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$ResourceCopyWith<_Resource> get copyWith =>
      __$ResourceCopyWithImpl<_Resource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResourceToJson(this);
  }
}

abstract class _Resource implements Resource {
  const factory _Resource(
      {@HiveField(0) required int id,
      @HiveField(1) required String name,
      @HiveField(2) required String url,
      @HiveField(3) required bool required,
      @HiveField(4) required ResourceType resourceType,
      @HiveField(5) required FileType fileType,
      @HiveField(6) required int version,
      @HiveField(7) required bool needRefresh,
      @HiveField(8) required bool downloaded,
      @HiveField(9) required bool bundled,
      @HiveField(10) String? description}) = _$_Resource;

  factory _Resource.fromJson(Map<String, dynamic> json) = _$_Resource.fromJson;

  @override
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool get required => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  ResourceType get resourceType => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  FileType get fileType => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  int get version => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  bool get needRefresh => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  bool get downloaded => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  bool get bundled => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResourceCopyWith<_Resource> get copyWith =>
      throw _privateConstructorUsedError;
}
