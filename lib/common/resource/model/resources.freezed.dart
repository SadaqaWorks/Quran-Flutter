// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'resources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Resources _$ResourcesFromJson(Map<String, dynamic> json) {
  return _Resources.fromJson(json);
}

/// @nodoc
class _$ResourcesTearOff {
  const _$ResourcesTearOff();

  _Resources call(
      {@HiveField(0) required DateTime storedTime,
      @HiveField(1) required List<Resource> list}) {
    return _Resources(
      storedTime: storedTime,
      list: list,
    );
  }

  Resources fromJson(Map<String, Object> json) {
    return Resources.fromJson(json);
  }
}

/// @nodoc
const $Resources = _$ResourcesTearOff();

/// @nodoc
mixin _$Resources {
  @HiveField(0)
  DateTime get storedTime => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Resource> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourcesCopyWith<Resources> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourcesCopyWith<$Res> {
  factory $ResourcesCopyWith(Resources value, $Res Function(Resources) then) =
      _$ResourcesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) DateTime storedTime, @HiveField(1) List<Resource> list});
}

/// @nodoc
class _$ResourcesCopyWithImpl<$Res> implements $ResourcesCopyWith<$Res> {
  _$ResourcesCopyWithImpl(this._value, this._then);

  final Resources _value;
  // ignore: unused_field
  final $Res Function(Resources) _then;

  @override
  $Res call({
    Object? storedTime = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      storedTime: storedTime == freezed
          ? _value.storedTime
          : storedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ));
  }
}

/// @nodoc
abstract class _$ResourcesCopyWith<$Res> implements $ResourcesCopyWith<$Res> {
  factory _$ResourcesCopyWith(
          _Resources value, $Res Function(_Resources) then) =
      __$ResourcesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) DateTime storedTime, @HiveField(1) List<Resource> list});
}

/// @nodoc
class __$ResourcesCopyWithImpl<$Res> extends _$ResourcesCopyWithImpl<$Res>
    implements _$ResourcesCopyWith<$Res> {
  __$ResourcesCopyWithImpl(_Resources _value, $Res Function(_Resources) _then)
      : super(_value, (v) => _then(v as _Resources));

  @override
  _Resources get _value => super._value as _Resources;

  @override
  $Res call({
    Object? storedTime = freezed,
    Object? list = freezed,
  }) {
    return _then(_Resources(
      storedTime: storedTime == freezed
          ? _value.storedTime
          : storedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ));
  }
}

@JsonSerializable()
@HiveType(typeId: 4)

/// @nodoc
class _$_Resources implements _Resources {
  const _$_Resources(
      {@HiveField(0) required this.storedTime,
      @HiveField(1) required this.list});

  factory _$_Resources.fromJson(Map<String, dynamic> json) =>
      _$_$_ResourcesFromJson(json);

  @override
  @HiveField(0)
  final DateTime storedTime;
  @override
  @HiveField(1)
  final List<Resource> list;

  @override
  String toString() {
    return 'Resources(storedTime: $storedTime, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Resources &&
            (identical(other.storedTime, storedTime) ||
                const DeepCollectionEquality()
                    .equals(other.storedTime, storedTime)) &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storedTime) ^
      const DeepCollectionEquality().hash(list);

  @JsonKey(ignore: true)
  @override
  _$ResourcesCopyWith<_Resources> get copyWith =>
      __$ResourcesCopyWithImpl<_Resources>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResourcesToJson(this);
  }
}

abstract class _Resources implements Resources {
  const factory _Resources(
      {@HiveField(0) required DateTime storedTime,
      @HiveField(1) required List<Resource> list}) = _$_Resources;

  factory _Resources.fromJson(Map<String, dynamic> json) =
      _$_Resources.fromJson;

  @override
  @HiveField(0)
  DateTime get storedTime => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<Resource> get list => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResourcesCopyWith<_Resources> get copyWith =>
      throw _privateConstructorUsedError;
}
