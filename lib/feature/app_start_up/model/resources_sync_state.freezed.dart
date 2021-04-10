// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'resources_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResourcesSyncStateTearOff {
  const _$ResourcesSyncStateTearOff();

  _Available available(List<Resource> resources) {
    return _Available(
      resources,
    );
  }

  _NeedsToDownload needsToDownload() {
    return const _NeedsToDownload();
  }

  _UnAvailable unAvailable() {
    return const _UnAvailable();
  }
}

/// @nodoc
const $ResourcesSyncState = _$ResourcesSyncStateTearOff();

/// @nodoc
mixin _$ResourcesSyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Resource> resources) available,
    required TResult Function() needsToDownload,
    required TResult Function() unAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Resource> resources)? available,
    TResult Function()? needsToDownload,
    TResult Function()? unAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NeedsToDownload value) needsToDownload,
    required TResult Function(_UnAvailable value) unAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NeedsToDownload value)? needsToDownload,
    TResult Function(_UnAvailable value)? unAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourcesSyncStateCopyWith<$Res> {
  factory $ResourcesSyncStateCopyWith(
          ResourcesSyncState value, $Res Function(ResourcesSyncState) then) =
      _$ResourcesSyncStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResourcesSyncStateCopyWithImpl<$Res>
    implements $ResourcesSyncStateCopyWith<$Res> {
  _$ResourcesSyncStateCopyWithImpl(this._value, this._then);

  final ResourcesSyncState _value;
  // ignore: unused_field
  final $Res Function(ResourcesSyncState) _then;
}

/// @nodoc
abstract class _$AvailableCopyWith<$Res> {
  factory _$AvailableCopyWith(
          _Available value, $Res Function(_Available) then) =
      __$AvailableCopyWithImpl<$Res>;
  $Res call({List<Resource> resources});
}

/// @nodoc
class __$AvailableCopyWithImpl<$Res>
    extends _$ResourcesSyncStateCopyWithImpl<$Res>
    implements _$AvailableCopyWith<$Res> {
  __$AvailableCopyWithImpl(_Available _value, $Res Function(_Available) _then)
      : super(_value, (v) => _then(v as _Available));

  @override
  _Available get _value => super._value as _Available;

  @override
  $Res call({
    Object? resources = freezed,
  }) {
    return _then(_Available(
      resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ));
  }
}

/// @nodoc
class _$_Available implements _Available {
  const _$_Available(this.resources);

  @override
  final List<Resource> resources;

  @override
  String toString() {
    return 'ResourcesSyncState.available(resources: $resources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Available &&
            (identical(other.resources, resources) ||
                const DeepCollectionEquality()
                    .equals(other.resources, resources)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(resources);

  @JsonKey(ignore: true)
  @override
  _$AvailableCopyWith<_Available> get copyWith =>
      __$AvailableCopyWithImpl<_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Resource> resources) available,
    required TResult Function() needsToDownload,
    required TResult Function() unAvailable,
  }) {
    return available(resources);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Resource> resources)? available,
    TResult Function()? needsToDownload,
    TResult Function()? unAvailable,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(resources);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NeedsToDownload value) needsToDownload,
    required TResult Function(_UnAvailable value) unAvailable,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NeedsToDownload value)? needsToDownload,
    TResult Function(_UnAvailable value)? unAvailable,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements ResourcesSyncState {
  const factory _Available(List<Resource> resources) = _$_Available;

  List<Resource> get resources => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AvailableCopyWith<_Available> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NeedsToDownloadCopyWith<$Res> {
  factory _$NeedsToDownloadCopyWith(
          _NeedsToDownload value, $Res Function(_NeedsToDownload) then) =
      __$NeedsToDownloadCopyWithImpl<$Res>;
}

/// @nodoc
class __$NeedsToDownloadCopyWithImpl<$Res>
    extends _$ResourcesSyncStateCopyWithImpl<$Res>
    implements _$NeedsToDownloadCopyWith<$Res> {
  __$NeedsToDownloadCopyWithImpl(
      _NeedsToDownload _value, $Res Function(_NeedsToDownload) _then)
      : super(_value, (v) => _then(v as _NeedsToDownload));

  @override
  _NeedsToDownload get _value => super._value as _NeedsToDownload;
}

/// @nodoc
class _$_NeedsToDownload implements _NeedsToDownload {
  const _$_NeedsToDownload();

  @override
  String toString() {
    return 'ResourcesSyncState.needsToDownload()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NeedsToDownload);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Resource> resources) available,
    required TResult Function() needsToDownload,
    required TResult Function() unAvailable,
  }) {
    return needsToDownload();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Resource> resources)? available,
    TResult Function()? needsToDownload,
    TResult Function()? unAvailable,
    required TResult orElse(),
  }) {
    if (needsToDownload != null) {
      return needsToDownload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NeedsToDownload value) needsToDownload,
    required TResult Function(_UnAvailable value) unAvailable,
  }) {
    return needsToDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NeedsToDownload value)? needsToDownload,
    TResult Function(_UnAvailable value)? unAvailable,
    required TResult orElse(),
  }) {
    if (needsToDownload != null) {
      return needsToDownload(this);
    }
    return orElse();
  }
}

abstract class _NeedsToDownload implements ResourcesSyncState {
  const factory _NeedsToDownload() = _$_NeedsToDownload;
}

/// @nodoc
abstract class _$UnAvailableCopyWith<$Res> {
  factory _$UnAvailableCopyWith(
          _UnAvailable value, $Res Function(_UnAvailable) then) =
      __$UnAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnAvailableCopyWithImpl<$Res>
    extends _$ResourcesSyncStateCopyWithImpl<$Res>
    implements _$UnAvailableCopyWith<$Res> {
  __$UnAvailableCopyWithImpl(
      _UnAvailable _value, $Res Function(_UnAvailable) _then)
      : super(_value, (v) => _then(v as _UnAvailable));

  @override
  _UnAvailable get _value => super._value as _UnAvailable;
}

/// @nodoc
class _$_UnAvailable implements _UnAvailable {
  const _$_UnAvailable();

  @override
  String toString() {
    return 'ResourcesSyncState.unAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UnAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Resource> resources) available,
    required TResult Function() needsToDownload,
    required TResult Function() unAvailable,
  }) {
    return unAvailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Resource> resources)? available,
    TResult Function()? needsToDownload,
    TResult Function()? unAvailable,
    required TResult orElse(),
  }) {
    if (unAvailable != null) {
      return unAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NeedsToDownload value) needsToDownload,
    required TResult Function(_UnAvailable value) unAvailable,
  }) {
    return unAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NeedsToDownload value)? needsToDownload,
    TResult Function(_UnAvailable value)? unAvailable,
    required TResult orElse(),
  }) {
    if (unAvailable != null) {
      return unAvailable(this);
    }
    return orElse();
  }
}

abstract class _UnAvailable implements ResourcesSyncState {
  const factory _UnAvailable() = _$_UnAvailable;
}
