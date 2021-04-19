// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'file_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************
/*
T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FileServiceStateTearOff {
  const _$FileServiceStateTearOff();

  _Available available(Database database) {
    return _Available(
      database,
    );
  }

  _NotAvailable notAvailable() {
    return const _NotAvailable();
  }
}

/// @nodoc
const $FileServiceState = _$FileServiceStateTearOff();

/// @nodoc
mixin _$FileServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Database database) available,
    required TResult Function() notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Database database)? available,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NotAvailable value) notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileServiceStateCopyWith<$Res> {
  factory $FileServiceStateCopyWith(
          FileServiceState value, $Res Function(FileServiceState) then) =
      _$FileServiceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FileServiceStateCopyWithImpl<$Res>
    implements $FileServiceStateCopyWith<$Res> {
  _$FileServiceStateCopyWithImpl(this._value, this._then);

  final FileServiceState _value;
  // ignore: unused_field
  final $Res Function(FileServiceState) _then;
}

/// @nodoc
abstract class _$AvailableCopyWith<$Res> {
  factory _$AvailableCopyWith(
          _Available value, $Res Function(_Available) then) =
      __$AvailableCopyWithImpl<$Res>;
  $Res call({Database database});
}

/// @nodoc
class __$AvailableCopyWithImpl<$Res>
    extends _$FileServiceStateCopyWithImpl<$Res>
    implements _$AvailableCopyWith<$Res> {
  __$AvailableCopyWithImpl(_Available _value, $Res Function(_Available) _then)
      : super(_value, (v) => _then(v as _Available));

  @override
  _Available get _value => super._value as _Available;

  @override
  $Res call({
    Object? database = freezed,
  }) {
    return _then(_Available(
      database == freezed
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as Database,
    ));
  }
}

/// @nodoc
class _$_Available implements _Available {
  const _$_Available(this.database);

  @override
  final Database database;

  @override
  String toString() {
    return 'FileServiceState.available(database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Available &&
            (identical(other.database, database) ||
                const DeepCollectionEquality()
                    .equals(other.database, database)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(database);

  @JsonKey(ignore: true)
  @override
  _$AvailableCopyWith<_Available> get copyWith =>
      __$AvailableCopyWithImpl<_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Database database) available,
    required TResult Function() notAvailable,
  }) {
    return available(database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Database database)? available,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NotAvailable value) notAvailable,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements FileServiceState {
  const factory _Available(Database database) = _$_Available;

  Database get database => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AvailableCopyWith<_Available> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NotAvailableCopyWith<$Res> {
  factory _$NotAvailableCopyWith(
          _NotAvailable value, $Res Function(_NotAvailable) then) =
      __$NotAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotAvailableCopyWithImpl<$Res>
    extends _$FileServiceStateCopyWithImpl<$Res>
    implements _$NotAvailableCopyWith<$Res> {
  __$NotAvailableCopyWithImpl(
      _NotAvailable _value, $Res Function(_NotAvailable) _then)
      : super(_value, (v) => _then(v as _NotAvailable));

  @override
  _NotAvailable get _value => super._value as _NotAvailable;
}

/// @nodoc
class _$_NotAvailable implements _NotAvailable {
  const _$_NotAvailable();

  @override
  String toString() {
    return 'FileServiceState.notAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NotAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Database database) available,
    required TResult Function() notAvailable,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Database database)? available,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NotAvailable value) notAvailable,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class _NotAvailable implements FileServiceState {
  const factory _NotAvailable() = _$_NotAvailable;
}
*/
