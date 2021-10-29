// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resource_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResourceSyncStateTearOff {
  const _$ResourceSyncStateTearOff();

  _Synced synced(Resource resource) {
    return _Synced(
      resource,
    );
  }

  _Syncing syncing(Resource resource) {
    return _Syncing(
      resource,
    );
  }

  _InternetUnAvailable internetUnAvailable(Resource resource) {
    return _InternetUnAvailable(
      resource,
    );
  }

  _failed failed(Resource resource) {
    return _failed(
      resource,
    );
  }
}

/// @nodoc
const $ResourceSyncState = _$ResourceSyncStateTearOff();

/// @nodoc
mixin _$ResourceSyncState {
  Resource get resource => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Resource resource) synced,
    required TResult Function(Resource resource) syncing,
    required TResult Function(Resource resource) internetUnAvailable,
    required TResult Function(Resource resource) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Synced value) synced,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_InternetUnAvailable value) internetUnAvailable,
    required TResult Function(_failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResourceSyncStateCopyWith<ResourceSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceSyncStateCopyWith<$Res> {
  factory $ResourceSyncStateCopyWith(
          ResourceSyncState value, $Res Function(ResourceSyncState) then) =
      _$ResourceSyncStateCopyWithImpl<$Res>;
  $Res call({Resource resource});

  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class _$ResourceSyncStateCopyWithImpl<$Res>
    implements $ResourceSyncStateCopyWith<$Res> {
  _$ResourceSyncStateCopyWithImpl(this._value, this._then);

  final ResourceSyncState _value;
  // ignore: unused_field
  final $Res Function(ResourceSyncState) _then;

  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_value.copyWith(
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
    ));
  }

  @override
  $ResourceCopyWith<$Res> get resource {
    return $ResourceCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value));
    });
  }
}

/// @nodoc
abstract class _$SyncedCopyWith<$Res>
    implements $ResourceSyncStateCopyWith<$Res> {
  factory _$SyncedCopyWith(_Synced value, $Res Function(_Synced) then) =
      __$SyncedCopyWithImpl<$Res>;
  @override
  $Res call({Resource resource});

  @override
  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$SyncedCopyWithImpl<$Res> extends _$ResourceSyncStateCopyWithImpl<$Res>
    implements _$SyncedCopyWith<$Res> {
  __$SyncedCopyWithImpl(_Synced _value, $Res Function(_Synced) _then)
      : super(_value, (v) => _then(v as _Synced));

  @override
  _Synced get _value => super._value as _Synced;

  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_Synced(
      resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
    ));
  }
}

/// @nodoc

class _$_Synced implements _Synced {
  const _$_Synced(this.resource);

  @override
  final Resource resource;

  @override
  String toString() {
    return 'ResourceSyncState.synced(resource: $resource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Synced &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @JsonKey(ignore: true)
  @override
  _$SyncedCopyWith<_Synced> get copyWith =>
      __$SyncedCopyWithImpl<_Synced>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Resource resource) synced,
    required TResult Function(Resource resource) syncing,
    required TResult Function(Resource resource) internetUnAvailable,
    required TResult Function(Resource resource) failed,
  }) {
    return synced(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
  }) {
    return synced?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Synced value) synced,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_InternetUnAvailable value) internetUnAvailable,
    required TResult Function(_failed value) failed,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }
}

abstract class _Synced implements ResourceSyncState {
  const factory _Synced(Resource resource) = _$_Synced;

  @override
  Resource get resource;
  @override
  @JsonKey(ignore: true)
  _$SyncedCopyWith<_Synced> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SyncingCopyWith<$Res>
    implements $ResourceSyncStateCopyWith<$Res> {
  factory _$SyncingCopyWith(_Syncing value, $Res Function(_Syncing) then) =
      __$SyncingCopyWithImpl<$Res>;
  @override
  $Res call({Resource resource});

  @override
  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$SyncingCopyWithImpl<$Res> extends _$ResourceSyncStateCopyWithImpl<$Res>
    implements _$SyncingCopyWith<$Res> {
  __$SyncingCopyWithImpl(_Syncing _value, $Res Function(_Syncing) _then)
      : super(_value, (v) => _then(v as _Syncing));

  @override
  _Syncing get _value => super._value as _Syncing;

  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_Syncing(
      resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
    ));
  }
}

/// @nodoc

class _$_Syncing implements _Syncing {
  const _$_Syncing(this.resource);

  @override
  final Resource resource;

  @override
  String toString() {
    return 'ResourceSyncState.syncing(resource: $resource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Syncing &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @JsonKey(ignore: true)
  @override
  _$SyncingCopyWith<_Syncing> get copyWith =>
      __$SyncingCopyWithImpl<_Syncing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Resource resource) synced,
    required TResult Function(Resource resource) syncing,
    required TResult Function(Resource resource) internetUnAvailable,
    required TResult Function(Resource resource) failed,
  }) {
    return syncing(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
  }) {
    return syncing?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Synced value) synced,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_InternetUnAvailable value) internetUnAvailable,
    required TResult Function(_failed value) failed,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements ResourceSyncState {
  const factory _Syncing(Resource resource) = _$_Syncing;

  @override
  Resource get resource;
  @override
  @JsonKey(ignore: true)
  _$SyncingCopyWith<_Syncing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$InternetUnAvailableCopyWith<$Res>
    implements $ResourceSyncStateCopyWith<$Res> {
  factory _$InternetUnAvailableCopyWith(_InternetUnAvailable value,
          $Res Function(_InternetUnAvailable) then) =
      __$InternetUnAvailableCopyWithImpl<$Res>;
  @override
  $Res call({Resource resource});

  @override
  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$InternetUnAvailableCopyWithImpl<$Res>
    extends _$ResourceSyncStateCopyWithImpl<$Res>
    implements _$InternetUnAvailableCopyWith<$Res> {
  __$InternetUnAvailableCopyWithImpl(
      _InternetUnAvailable _value, $Res Function(_InternetUnAvailable) _then)
      : super(_value, (v) => _then(v as _InternetUnAvailable));

  @override
  _InternetUnAvailable get _value => super._value as _InternetUnAvailable;

  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_InternetUnAvailable(
      resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
    ));
  }
}

/// @nodoc

class _$_InternetUnAvailable implements _InternetUnAvailable {
  const _$_InternetUnAvailable(this.resource);

  @override
  final Resource resource;

  @override
  String toString() {
    return 'ResourceSyncState.internetUnAvailable(resource: $resource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InternetUnAvailable &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @JsonKey(ignore: true)
  @override
  _$InternetUnAvailableCopyWith<_InternetUnAvailable> get copyWith =>
      __$InternetUnAvailableCopyWithImpl<_InternetUnAvailable>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Resource resource) synced,
    required TResult Function(Resource resource) syncing,
    required TResult Function(Resource resource) internetUnAvailable,
    required TResult Function(Resource resource) failed,
  }) {
    return internetUnAvailable(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
  }) {
    return internetUnAvailable?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
    required TResult orElse(),
  }) {
    if (internetUnAvailable != null) {
      return internetUnAvailable(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Synced value) synced,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_InternetUnAvailable value) internetUnAvailable,
    required TResult Function(_failed value) failed,
  }) {
    return internetUnAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
  }) {
    return internetUnAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
    required TResult orElse(),
  }) {
    if (internetUnAvailable != null) {
      return internetUnAvailable(this);
    }
    return orElse();
  }
}

abstract class _InternetUnAvailable implements ResourceSyncState {
  const factory _InternetUnAvailable(Resource resource) =
      _$_InternetUnAvailable;

  @override
  Resource get resource;
  @override
  @JsonKey(ignore: true)
  _$InternetUnAvailableCopyWith<_InternetUnAvailable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$failedCopyWith<$Res>
    implements $ResourceSyncStateCopyWith<$Res> {
  factory _$failedCopyWith(_failed value, $Res Function(_failed) then) =
      __$failedCopyWithImpl<$Res>;
  @override
  $Res call({Resource resource});

  @override
  $ResourceCopyWith<$Res> get resource;
}

/// @nodoc
class __$failedCopyWithImpl<$Res> extends _$ResourceSyncStateCopyWithImpl<$Res>
    implements _$failedCopyWith<$Res> {
  __$failedCopyWithImpl(_failed _value, $Res Function(_failed) _then)
      : super(_value, (v) => _then(v as _failed));

  @override
  _failed get _value => super._value as _failed;

  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_failed(
      resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource,
    ));
  }
}

/// @nodoc

class _$_failed implements _failed {
  const _$_failed(this.resource);

  @override
  final Resource resource;

  @override
  String toString() {
    return 'ResourceSyncState.failed(resource: $resource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _failed &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @JsonKey(ignore: true)
  @override
  _$failedCopyWith<_failed> get copyWith =>
      __$failedCopyWithImpl<_failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Resource resource) synced,
    required TResult Function(Resource resource) syncing,
    required TResult Function(Resource resource) internetUnAvailable,
    required TResult Function(Resource resource) failed,
  }) {
    return failed(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
  }) {
    return failed?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Resource resource)? synced,
    TResult Function(Resource resource)? syncing,
    TResult Function(Resource resource)? internetUnAvailable,
    TResult Function(Resource resource)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Synced value) synced,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_InternetUnAvailable value) internetUnAvailable,
    required TResult Function(_failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Synced value)? synced,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_InternetUnAvailable value)? internetUnAvailable,
    TResult Function(_failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _failed implements ResourceSyncState {
  const factory _failed(Resource resource) = _$_failed;

  @override
  Resource get resource;
  @override
  @JsonKey(ignore: true)
  _$failedCopyWith<_failed> get copyWith => throw _privateConstructorUsedError;
}
