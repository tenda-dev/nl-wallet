// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bridge_generated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardPersistence {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inMemory,
    required TResult Function(String id) stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inMemory,
    TResult? Function(String id)? stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inMemory,
    TResult Function(String id)? stored,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardPersistence_InMemory value) inMemory,
    required TResult Function(CardPersistence_Stored value) stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardPersistence_InMemory value)? inMemory,
    TResult? Function(CardPersistence_Stored value)? stored,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardPersistence_InMemory value)? inMemory,
    TResult Function(CardPersistence_Stored value)? stored,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardPersistenceCopyWith<$Res> {
  factory $CardPersistenceCopyWith(CardPersistence value, $Res Function(CardPersistence) then) =
      _$CardPersistenceCopyWithImpl<$Res, CardPersistence>;
}

/// @nodoc
class _$CardPersistenceCopyWithImpl<$Res, $Val extends CardPersistence> implements $CardPersistenceCopyWith<$Res> {
  _$CardPersistenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CardPersistence_InMemoryImplCopyWith<$Res> {
  factory _$$CardPersistence_InMemoryImplCopyWith(
          _$CardPersistence_InMemoryImpl value, $Res Function(_$CardPersistence_InMemoryImpl) then) =
      __$$CardPersistence_InMemoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CardPersistence_InMemoryImplCopyWithImpl<$Res>
    extends _$CardPersistenceCopyWithImpl<$Res, _$CardPersistence_InMemoryImpl>
    implements _$$CardPersistence_InMemoryImplCopyWith<$Res> {
  __$$CardPersistence_InMemoryImplCopyWithImpl(
      _$CardPersistence_InMemoryImpl _value, $Res Function(_$CardPersistence_InMemoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CardPersistence_InMemoryImpl implements CardPersistence_InMemory {
  const _$CardPersistence_InMemoryImpl();

  @override
  String toString() {
    return 'CardPersistence.inMemory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$CardPersistence_InMemoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inMemory,
    required TResult Function(String id) stored,
  }) {
    return inMemory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inMemory,
    TResult? Function(String id)? stored,
  }) {
    return inMemory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inMemory,
    TResult Function(String id)? stored,
    required TResult orElse(),
  }) {
    if (inMemory != null) {
      return inMemory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardPersistence_InMemory value) inMemory,
    required TResult Function(CardPersistence_Stored value) stored,
  }) {
    return inMemory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardPersistence_InMemory value)? inMemory,
    TResult? Function(CardPersistence_Stored value)? stored,
  }) {
    return inMemory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardPersistence_InMemory value)? inMemory,
    TResult Function(CardPersistence_Stored value)? stored,
    required TResult orElse(),
  }) {
    if (inMemory != null) {
      return inMemory(this);
    }
    return orElse();
  }
}

abstract class CardPersistence_InMemory implements CardPersistence {
  const factory CardPersistence_InMemory() = _$CardPersistence_InMemoryImpl;
}

/// @nodoc
abstract class _$$CardPersistence_StoredImplCopyWith<$Res> {
  factory _$$CardPersistence_StoredImplCopyWith(
          _$CardPersistence_StoredImpl value, $Res Function(_$CardPersistence_StoredImpl) then) =
      __$$CardPersistence_StoredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$CardPersistence_StoredImplCopyWithImpl<$Res>
    extends _$CardPersistenceCopyWithImpl<$Res, _$CardPersistence_StoredImpl>
    implements _$$CardPersistence_StoredImplCopyWith<$Res> {
  __$$CardPersistence_StoredImplCopyWithImpl(
      _$CardPersistence_StoredImpl _value, $Res Function(_$CardPersistence_StoredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CardPersistence_StoredImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardPersistence_StoredImpl implements CardPersistence_Stored {
  const _$CardPersistence_StoredImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'CardPersistence.stored(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardPersistence_StoredImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardPersistence_StoredImplCopyWith<_$CardPersistence_StoredImpl> get copyWith =>
      __$$CardPersistence_StoredImplCopyWithImpl<_$CardPersistence_StoredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inMemory,
    required TResult Function(String id) stored,
  }) {
    return stored(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inMemory,
    TResult? Function(String id)? stored,
  }) {
    return stored?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inMemory,
    TResult Function(String id)? stored,
    required TResult orElse(),
  }) {
    if (stored != null) {
      return stored(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardPersistence_InMemory value) inMemory,
    required TResult Function(CardPersistence_Stored value) stored,
  }) {
    return stored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardPersistence_InMemory value)? inMemory,
    TResult? Function(CardPersistence_Stored value)? stored,
  }) {
    return stored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardPersistence_InMemory value)? inMemory,
    TResult Function(CardPersistence_Stored value)? stored,
    required TResult orElse(),
  }) {
    if (stored != null) {
      return stored(this);
    }
    return orElse();
  }
}

abstract class CardPersistence_Stored implements CardPersistence {
  const factory CardPersistence_Stored({required final String id}) = _$CardPersistence_StoredImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$CardPersistence_StoredImplCopyWith<_$CardPersistence_StoredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardValue {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(bool value) boolean,
    required TResult Function(String value) date,
    required TResult Function(GenderCardValue value) gender,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(bool value)? boolean,
    TResult? Function(String value)? date,
    TResult? Function(GenderCardValue value)? gender,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(bool value)? boolean,
    TResult Function(String value)? date,
    TResult Function(GenderCardValue value)? gender,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardValue_String value) string,
    required TResult Function(CardValue_Boolean value) boolean,
    required TResult Function(CardValue_Date value) date,
    required TResult Function(CardValue_Gender value) gender,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardValue_String value)? string,
    TResult? Function(CardValue_Boolean value)? boolean,
    TResult? Function(CardValue_Date value)? date,
    TResult? Function(CardValue_Gender value)? gender,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardValue_String value)? string,
    TResult Function(CardValue_Boolean value)? boolean,
    TResult Function(CardValue_Date value)? date,
    TResult Function(CardValue_Gender value)? gender,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardValueCopyWith<$Res> {
  factory $CardValueCopyWith(CardValue value, $Res Function(CardValue) then) = _$CardValueCopyWithImpl<$Res, CardValue>;
}

/// @nodoc
class _$CardValueCopyWithImpl<$Res, $Val extends CardValue> implements $CardValueCopyWith<$Res> {
  _$CardValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CardValue_StringImplCopyWith<$Res> {
  factory _$$CardValue_StringImplCopyWith(_$CardValue_StringImpl value, $Res Function(_$CardValue_StringImpl) then) =
      __$$CardValue_StringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$CardValue_StringImplCopyWithImpl<$Res> extends _$CardValueCopyWithImpl<$Res, _$CardValue_StringImpl>
    implements _$$CardValue_StringImplCopyWith<$Res> {
  __$$CardValue_StringImplCopyWithImpl(_$CardValue_StringImpl _value, $Res Function(_$CardValue_StringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CardValue_StringImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardValue_StringImpl implements CardValue_String {
  const _$CardValue_StringImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'CardValue.string(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardValue_StringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardValue_StringImplCopyWith<_$CardValue_StringImpl> get copyWith =>
      __$$CardValue_StringImplCopyWithImpl<_$CardValue_StringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(bool value) boolean,
    required TResult Function(String value) date,
    required TResult Function(GenderCardValue value) gender,
  }) {
    return string(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(bool value)? boolean,
    TResult? Function(String value)? date,
    TResult? Function(GenderCardValue value)? gender,
  }) {
    return string?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(bool value)? boolean,
    TResult Function(String value)? date,
    TResult Function(GenderCardValue value)? gender,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardValue_String value) string,
    required TResult Function(CardValue_Boolean value) boolean,
    required TResult Function(CardValue_Date value) date,
    required TResult Function(CardValue_Gender value) gender,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardValue_String value)? string,
    TResult? Function(CardValue_Boolean value)? boolean,
    TResult? Function(CardValue_Date value)? date,
    TResult? Function(CardValue_Gender value)? gender,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardValue_String value)? string,
    TResult Function(CardValue_Boolean value)? boolean,
    TResult Function(CardValue_Date value)? date,
    TResult Function(CardValue_Gender value)? gender,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }
}

abstract class CardValue_String implements CardValue {
  const factory CardValue_String({required final String value}) = _$CardValue_StringImpl;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$CardValue_StringImplCopyWith<_$CardValue_StringImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardValue_BooleanImplCopyWith<$Res> {
  factory _$$CardValue_BooleanImplCopyWith(_$CardValue_BooleanImpl value, $Res Function(_$CardValue_BooleanImpl) then) =
      __$$CardValue_BooleanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$CardValue_BooleanImplCopyWithImpl<$Res> extends _$CardValueCopyWithImpl<$Res, _$CardValue_BooleanImpl>
    implements _$$CardValue_BooleanImplCopyWith<$Res> {
  __$$CardValue_BooleanImplCopyWithImpl(_$CardValue_BooleanImpl _value, $Res Function(_$CardValue_BooleanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CardValue_BooleanImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CardValue_BooleanImpl implements CardValue_Boolean {
  const _$CardValue_BooleanImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'CardValue.boolean(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardValue_BooleanImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardValue_BooleanImplCopyWith<_$CardValue_BooleanImpl> get copyWith =>
      __$$CardValue_BooleanImplCopyWithImpl<_$CardValue_BooleanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(bool value) boolean,
    required TResult Function(String value) date,
    required TResult Function(GenderCardValue value) gender,
  }) {
    return boolean(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(bool value)? boolean,
    TResult? Function(String value)? date,
    TResult? Function(GenderCardValue value)? gender,
  }) {
    return boolean?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(bool value)? boolean,
    TResult Function(String value)? date,
    TResult Function(GenderCardValue value)? gender,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardValue_String value) string,
    required TResult Function(CardValue_Boolean value) boolean,
    required TResult Function(CardValue_Date value) date,
    required TResult Function(CardValue_Gender value) gender,
  }) {
    return boolean(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardValue_String value)? string,
    TResult? Function(CardValue_Boolean value)? boolean,
    TResult? Function(CardValue_Date value)? date,
    TResult? Function(CardValue_Gender value)? gender,
  }) {
    return boolean?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardValue_String value)? string,
    TResult Function(CardValue_Boolean value)? boolean,
    TResult Function(CardValue_Date value)? date,
    TResult Function(CardValue_Gender value)? gender,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(this);
    }
    return orElse();
  }
}

abstract class CardValue_Boolean implements CardValue {
  const factory CardValue_Boolean({required final bool value}) = _$CardValue_BooleanImpl;

  @override
  bool get value;
  @JsonKey(ignore: true)
  _$$CardValue_BooleanImplCopyWith<_$CardValue_BooleanImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardValue_DateImplCopyWith<$Res> {
  factory _$$CardValue_DateImplCopyWith(_$CardValue_DateImpl value, $Res Function(_$CardValue_DateImpl) then) =
      __$$CardValue_DateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$CardValue_DateImplCopyWithImpl<$Res> extends _$CardValueCopyWithImpl<$Res, _$CardValue_DateImpl>
    implements _$$CardValue_DateImplCopyWith<$Res> {
  __$$CardValue_DateImplCopyWithImpl(_$CardValue_DateImpl _value, $Res Function(_$CardValue_DateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CardValue_DateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardValue_DateImpl implements CardValue_Date {
  const _$CardValue_DateImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'CardValue.date(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardValue_DateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardValue_DateImplCopyWith<_$CardValue_DateImpl> get copyWith =>
      __$$CardValue_DateImplCopyWithImpl<_$CardValue_DateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(bool value) boolean,
    required TResult Function(String value) date,
    required TResult Function(GenderCardValue value) gender,
  }) {
    return date(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(bool value)? boolean,
    TResult? Function(String value)? date,
    TResult? Function(GenderCardValue value)? gender,
  }) {
    return date?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(bool value)? boolean,
    TResult Function(String value)? date,
    TResult Function(GenderCardValue value)? gender,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardValue_String value) string,
    required TResult Function(CardValue_Boolean value) boolean,
    required TResult Function(CardValue_Date value) date,
    required TResult Function(CardValue_Gender value) gender,
  }) {
    return date(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardValue_String value)? string,
    TResult? Function(CardValue_Boolean value)? boolean,
    TResult? Function(CardValue_Date value)? date,
    TResult? Function(CardValue_Gender value)? gender,
  }) {
    return date?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardValue_String value)? string,
    TResult Function(CardValue_Boolean value)? boolean,
    TResult Function(CardValue_Date value)? date,
    TResult Function(CardValue_Gender value)? gender,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(this);
    }
    return orElse();
  }
}

abstract class CardValue_Date implements CardValue {
  const factory CardValue_Date({required final String value}) = _$CardValue_DateImpl;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$CardValue_DateImplCopyWith<_$CardValue_DateImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardValue_GenderImplCopyWith<$Res> {
  factory _$$CardValue_GenderImplCopyWith(_$CardValue_GenderImpl value, $Res Function(_$CardValue_GenderImpl) then) =
      __$$CardValue_GenderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GenderCardValue value});
}

/// @nodoc
class __$$CardValue_GenderImplCopyWithImpl<$Res> extends _$CardValueCopyWithImpl<$Res, _$CardValue_GenderImpl>
    implements _$$CardValue_GenderImplCopyWith<$Res> {
  __$$CardValue_GenderImplCopyWithImpl(_$CardValue_GenderImpl _value, $Res Function(_$CardValue_GenderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CardValue_GenderImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as GenderCardValue,
    ));
  }
}

/// @nodoc

class _$CardValue_GenderImpl implements CardValue_Gender {
  const _$CardValue_GenderImpl({required this.value});

  @override
  final GenderCardValue value;

  @override
  String toString() {
    return 'CardValue.gender(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardValue_GenderImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardValue_GenderImplCopyWith<_$CardValue_GenderImpl> get copyWith =>
      __$$CardValue_GenderImplCopyWithImpl<_$CardValue_GenderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) string,
    required TResult Function(bool value) boolean,
    required TResult Function(String value) date,
    required TResult Function(GenderCardValue value) gender,
  }) {
    return gender(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? string,
    TResult? Function(bool value)? boolean,
    TResult? Function(String value)? date,
    TResult? Function(GenderCardValue value)? gender,
  }) {
    return gender?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? string,
    TResult Function(bool value)? boolean,
    TResult Function(String value)? date,
    TResult Function(GenderCardValue value)? gender,
    required TResult orElse(),
  }) {
    if (gender != null) {
      return gender(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardValue_String value) string,
    required TResult Function(CardValue_Boolean value) boolean,
    required TResult Function(CardValue_Date value) date,
    required TResult Function(CardValue_Gender value) gender,
  }) {
    return gender(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardValue_String value)? string,
    TResult? Function(CardValue_Boolean value)? boolean,
    TResult? Function(CardValue_Date value)? date,
    TResult? Function(CardValue_Gender value)? gender,
  }) {
    return gender?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardValue_String value)? string,
    TResult Function(CardValue_Boolean value)? boolean,
    TResult Function(CardValue_Date value)? date,
    TResult Function(CardValue_Gender value)? gender,
    required TResult orElse(),
  }) {
    if (gender != null) {
      return gender(this);
    }
    return orElse();
  }
}

abstract class CardValue_Gender implements CardValue {
  const factory CardValue_Gender({required final GenderCardValue value}) = _$CardValue_GenderImpl;

  @override
  GenderCardValue get value;
  @JsonKey(ignore: true)
  _$$CardValue_GenderImplCopyWith<_$CardValue_GenderImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Image {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String xml) svg,
    required TResult Function(String base64) png,
    required TResult Function(String base64) jpg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String xml)? svg,
    TResult? Function(String base64)? png,
    TResult? Function(String base64)? jpg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String xml)? svg,
    TResult Function(String base64)? png,
    TResult Function(String base64)? jpg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Svg value) svg,
    required TResult Function(Image_Png value) png,
    required TResult Function(Image_Jpg value) jpg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Svg value)? svg,
    TResult? Function(Image_Png value)? png,
    TResult? Function(Image_Jpg value)? jpg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Svg value)? svg,
    TResult Function(Image_Png value)? png,
    TResult Function(Image_Jpg value)? jpg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) = _$ImageCopyWithImpl<$Res, Image>;
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image> implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$Image_SvgImplCopyWith<$Res> {
  factory _$$Image_SvgImplCopyWith(_$Image_SvgImpl value, $Res Function(_$Image_SvgImpl) then) =
      __$$Image_SvgImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String xml});
}

/// @nodoc
class __$$Image_SvgImplCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$Image_SvgImpl>
    implements _$$Image_SvgImplCopyWith<$Res> {
  __$$Image_SvgImplCopyWithImpl(_$Image_SvgImpl _value, $Res Function(_$Image_SvgImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xml = null,
  }) {
    return _then(_$Image_SvgImpl(
      xml: null == xml
          ? _value.xml
          : xml // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Image_SvgImpl implements Image_Svg {
  const _$Image_SvgImpl({required this.xml});

  @override
  final String xml;

  @override
  String toString() {
    return 'Image.svg(xml: $xml)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Image_SvgImpl &&
            (identical(other.xml, xml) || other.xml == xml));
  }

  @override
  int get hashCode => Object.hash(runtimeType, xml);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Image_SvgImplCopyWith<_$Image_SvgImpl> get copyWith =>
      __$$Image_SvgImplCopyWithImpl<_$Image_SvgImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String xml) svg,
    required TResult Function(String base64) png,
    required TResult Function(String base64) jpg,
  }) {
    return svg(xml);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String xml)? svg,
    TResult? Function(String base64)? png,
    TResult? Function(String base64)? jpg,
  }) {
    return svg?.call(xml);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String xml)? svg,
    TResult Function(String base64)? png,
    TResult Function(String base64)? jpg,
    required TResult orElse(),
  }) {
    if (svg != null) {
      return svg(xml);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Svg value) svg,
    required TResult Function(Image_Png value) png,
    required TResult Function(Image_Jpg value) jpg,
  }) {
    return svg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Svg value)? svg,
    TResult? Function(Image_Png value)? png,
    TResult? Function(Image_Jpg value)? jpg,
  }) {
    return svg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Svg value)? svg,
    TResult Function(Image_Png value)? png,
    TResult Function(Image_Jpg value)? jpg,
    required TResult orElse(),
  }) {
    if (svg != null) {
      return svg(this);
    }
    return orElse();
  }
}

abstract class Image_Svg implements Image {
  const factory Image_Svg({required final String xml}) = _$Image_SvgImpl;

  String get xml;
  @JsonKey(ignore: true)
  _$$Image_SvgImplCopyWith<_$Image_SvgImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Image_PngImplCopyWith<$Res> {
  factory _$$Image_PngImplCopyWith(_$Image_PngImpl value, $Res Function(_$Image_PngImpl) then) =
      __$$Image_PngImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String base64});
}

/// @nodoc
class __$$Image_PngImplCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$Image_PngImpl>
    implements _$$Image_PngImplCopyWith<$Res> {
  __$$Image_PngImplCopyWithImpl(_$Image_PngImpl _value, $Res Function(_$Image_PngImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64 = null,
  }) {
    return _then(_$Image_PngImpl(
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Image_PngImpl implements Image_Png {
  const _$Image_PngImpl({required this.base64});

  @override
  final String base64;

  @override
  String toString() {
    return 'Image.png(base64: $base64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Image_PngImpl &&
            (identical(other.base64, base64) || other.base64 == base64));
  }

  @override
  int get hashCode => Object.hash(runtimeType, base64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Image_PngImplCopyWith<_$Image_PngImpl> get copyWith =>
      __$$Image_PngImplCopyWithImpl<_$Image_PngImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String xml) svg,
    required TResult Function(String base64) png,
    required TResult Function(String base64) jpg,
  }) {
    return png(base64);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String xml)? svg,
    TResult? Function(String base64)? png,
    TResult? Function(String base64)? jpg,
  }) {
    return png?.call(base64);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String xml)? svg,
    TResult Function(String base64)? png,
    TResult Function(String base64)? jpg,
    required TResult orElse(),
  }) {
    if (png != null) {
      return png(base64);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Svg value) svg,
    required TResult Function(Image_Png value) png,
    required TResult Function(Image_Jpg value) jpg,
  }) {
    return png(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Svg value)? svg,
    TResult? Function(Image_Png value)? png,
    TResult? Function(Image_Jpg value)? jpg,
  }) {
    return png?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Svg value)? svg,
    TResult Function(Image_Png value)? png,
    TResult Function(Image_Jpg value)? jpg,
    required TResult orElse(),
  }) {
    if (png != null) {
      return png(this);
    }
    return orElse();
  }
}

abstract class Image_Png implements Image {
  const factory Image_Png({required final String base64}) = _$Image_PngImpl;

  String get base64;
  @JsonKey(ignore: true)
  _$$Image_PngImplCopyWith<_$Image_PngImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Image_JpgImplCopyWith<$Res> {
  factory _$$Image_JpgImplCopyWith(_$Image_JpgImpl value, $Res Function(_$Image_JpgImpl) then) =
      __$$Image_JpgImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String base64});
}

/// @nodoc
class __$$Image_JpgImplCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$Image_JpgImpl>
    implements _$$Image_JpgImplCopyWith<$Res> {
  __$$Image_JpgImplCopyWithImpl(_$Image_JpgImpl _value, $Res Function(_$Image_JpgImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64 = null,
  }) {
    return _then(_$Image_JpgImpl(
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Image_JpgImpl implements Image_Jpg {
  const _$Image_JpgImpl({required this.base64});

  @override
  final String base64;

  @override
  String toString() {
    return 'Image.jpg(base64: $base64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Image_JpgImpl &&
            (identical(other.base64, base64) || other.base64 == base64));
  }

  @override
  int get hashCode => Object.hash(runtimeType, base64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Image_JpgImplCopyWith<_$Image_JpgImpl> get copyWith =>
      __$$Image_JpgImplCopyWithImpl<_$Image_JpgImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String xml) svg,
    required TResult Function(String base64) png,
    required TResult Function(String base64) jpg,
  }) {
    return jpg(base64);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String xml)? svg,
    TResult? Function(String base64)? png,
    TResult? Function(String base64)? jpg,
  }) {
    return jpg?.call(base64);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String xml)? svg,
    TResult Function(String base64)? png,
    TResult Function(String base64)? jpg,
    required TResult orElse(),
  }) {
    if (jpg != null) {
      return jpg(base64);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Image_Svg value) svg,
    required TResult Function(Image_Png value) png,
    required TResult Function(Image_Jpg value) jpg,
  }) {
    return jpg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Image_Svg value)? svg,
    TResult? Function(Image_Png value)? png,
    TResult? Function(Image_Jpg value)? jpg,
  }) {
    return jpg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Image_Svg value)? svg,
    TResult Function(Image_Png value)? png,
    TResult Function(Image_Jpg value)? jpg,
    required TResult orElse(),
  }) {
    if (jpg != null) {
      return jpg(this);
    }
    return orElse();
  }
}

abstract class Image_Jpg implements Image {
  const factory Image_Jpg({required final String base64}) = _$Image_JpgImpl;

  String get base64;
  @JsonKey(ignore: true)
  _$$Image_JpgImplCopyWith<_$Image_JpgImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StartDisclosureResult {
  Organization get relyingParty => throw _privateConstructorUsedError;
  bool get isFirstInteractionWithRelyingParty => throw _privateConstructorUsedError;
  List<LocalizedString> get requestPurpose => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)
        request,
    required TResult Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)
        requestAttributesMissing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        request,
    TResult? Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        requestAttributesMissing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        request,
    TResult Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        requestAttributesMissing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartDisclosureResult_Request value) request,
    required TResult Function(StartDisclosureResult_RequestAttributesMissing value) requestAttributesMissing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartDisclosureResult_Request value)? request,
    TResult? Function(StartDisclosureResult_RequestAttributesMissing value)? requestAttributesMissing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartDisclosureResult_Request value)? request,
    TResult Function(StartDisclosureResult_RequestAttributesMissing value)? requestAttributesMissing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartDisclosureResultCopyWith<StartDisclosureResult> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartDisclosureResultCopyWith<$Res> {
  factory $StartDisclosureResultCopyWith(StartDisclosureResult value, $Res Function(StartDisclosureResult) then) =
      _$StartDisclosureResultCopyWithImpl<$Res, StartDisclosureResult>;
  @useResult
  $Res call({Organization relyingParty, bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose});
}

/// @nodoc
class _$StartDisclosureResultCopyWithImpl<$Res, $Val extends StartDisclosureResult>
    implements $StartDisclosureResultCopyWith<$Res> {
  _$StartDisclosureResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relyingParty = null,
    Object? isFirstInteractionWithRelyingParty = null,
    Object? requestPurpose = null,
  }) {
    return _then(_value.copyWith(
      relyingParty: null == relyingParty
          ? _value.relyingParty
          : relyingParty // ignore: cast_nullable_to_non_nullable
              as Organization,
      isFirstInteractionWithRelyingParty: null == isFirstInteractionWithRelyingParty
          ? _value.isFirstInteractionWithRelyingParty
          : isFirstInteractionWithRelyingParty // ignore: cast_nullable_to_non_nullable
              as bool,
      requestPurpose: null == requestPurpose
          ? _value.requestPurpose
          : requestPurpose // ignore: cast_nullable_to_non_nullable
              as List<LocalizedString>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartDisclosureResult_RequestImplCopyWith<$Res> implements $StartDisclosureResultCopyWith<$Res> {
  factory _$$StartDisclosureResult_RequestImplCopyWith(
          _$StartDisclosureResult_RequestImpl value, $Res Function(_$StartDisclosureResult_RequestImpl) then) =
      __$$StartDisclosureResult_RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Organization relyingParty,
      RequestPolicy policy,
      List<RequestedCard> requestedCards,
      bool isFirstInteractionWithRelyingParty,
      List<LocalizedString> requestPurpose});
}

/// @nodoc
class __$$StartDisclosureResult_RequestImplCopyWithImpl<$Res>
    extends _$StartDisclosureResultCopyWithImpl<$Res, _$StartDisclosureResult_RequestImpl>
    implements _$$StartDisclosureResult_RequestImplCopyWith<$Res> {
  __$$StartDisclosureResult_RequestImplCopyWithImpl(
      _$StartDisclosureResult_RequestImpl _value, $Res Function(_$StartDisclosureResult_RequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relyingParty = null,
    Object? policy = null,
    Object? requestedCards = null,
    Object? isFirstInteractionWithRelyingParty = null,
    Object? requestPurpose = null,
  }) {
    return _then(_$StartDisclosureResult_RequestImpl(
      relyingParty: null == relyingParty
          ? _value.relyingParty
          : relyingParty // ignore: cast_nullable_to_non_nullable
              as Organization,
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as RequestPolicy,
      requestedCards: null == requestedCards
          ? _value._requestedCards
          : requestedCards // ignore: cast_nullable_to_non_nullable
              as List<RequestedCard>,
      isFirstInteractionWithRelyingParty: null == isFirstInteractionWithRelyingParty
          ? _value.isFirstInteractionWithRelyingParty
          : isFirstInteractionWithRelyingParty // ignore: cast_nullable_to_non_nullable
              as bool,
      requestPurpose: null == requestPurpose
          ? _value._requestPurpose
          : requestPurpose // ignore: cast_nullable_to_non_nullable
              as List<LocalizedString>,
    ));
  }
}

/// @nodoc

class _$StartDisclosureResult_RequestImpl implements StartDisclosureResult_Request {
  const _$StartDisclosureResult_RequestImpl(
      {required this.relyingParty,
      required this.policy,
      required final List<RequestedCard> requestedCards,
      required this.isFirstInteractionWithRelyingParty,
      required final List<LocalizedString> requestPurpose})
      : _requestedCards = requestedCards,
        _requestPurpose = requestPurpose;

  @override
  final Organization relyingParty;
  @override
  final RequestPolicy policy;
  final List<RequestedCard> _requestedCards;
  @override
  List<RequestedCard> get requestedCards {
    if (_requestedCards is EqualUnmodifiableListView) return _requestedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestedCards);
  }

  @override
  final bool isFirstInteractionWithRelyingParty;
  final List<LocalizedString> _requestPurpose;
  @override
  List<LocalizedString> get requestPurpose {
    if (_requestPurpose is EqualUnmodifiableListView) return _requestPurpose;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestPurpose);
  }

  @override
  String toString() {
    return 'StartDisclosureResult.request(relyingParty: $relyingParty, policy: $policy, requestedCards: $requestedCards, isFirstInteractionWithRelyingParty: $isFirstInteractionWithRelyingParty, requestPurpose: $requestPurpose)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartDisclosureResult_RequestImpl &&
            (identical(other.relyingParty, relyingParty) || other.relyingParty == relyingParty) &&
            (identical(other.policy, policy) || other.policy == policy) &&
            const DeepCollectionEquality().equals(other._requestedCards, _requestedCards) &&
            (identical(other.isFirstInteractionWithRelyingParty, isFirstInteractionWithRelyingParty) ||
                other.isFirstInteractionWithRelyingParty == isFirstInteractionWithRelyingParty) &&
            const DeepCollectionEquality().equals(other._requestPurpose, _requestPurpose));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      relyingParty,
      policy,
      const DeepCollectionEquality().hash(_requestedCards),
      isFirstInteractionWithRelyingParty,
      const DeepCollectionEquality().hash(_requestPurpose));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartDisclosureResult_RequestImplCopyWith<_$StartDisclosureResult_RequestImpl> get copyWith =>
      __$$StartDisclosureResult_RequestImplCopyWithImpl<_$StartDisclosureResult_RequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)
        request,
    required TResult Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)
        requestAttributesMissing,
  }) {
    return request(relyingParty, policy, requestedCards, isFirstInteractionWithRelyingParty, requestPurpose);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        request,
    TResult? Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        requestAttributesMissing,
  }) {
    return request?.call(relyingParty, policy, requestedCards, isFirstInteractionWithRelyingParty, requestPurpose);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        request,
    TResult Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        requestAttributesMissing,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(relyingParty, policy, requestedCards, isFirstInteractionWithRelyingParty, requestPurpose);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartDisclosureResult_Request value) request,
    required TResult Function(StartDisclosureResult_RequestAttributesMissing value) requestAttributesMissing,
  }) {
    return request(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartDisclosureResult_Request value)? request,
    TResult? Function(StartDisclosureResult_RequestAttributesMissing value)? requestAttributesMissing,
  }) {
    return request?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartDisclosureResult_Request value)? request,
    TResult Function(StartDisclosureResult_RequestAttributesMissing value)? requestAttributesMissing,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(this);
    }
    return orElse();
  }
}

abstract class StartDisclosureResult_Request implements StartDisclosureResult {
  const factory StartDisclosureResult_Request(
      {required final Organization relyingParty,
      required final RequestPolicy policy,
      required final List<RequestedCard> requestedCards,
      required final bool isFirstInteractionWithRelyingParty,
      required final List<LocalizedString> requestPurpose}) = _$StartDisclosureResult_RequestImpl;

  @override
  Organization get relyingParty;
  RequestPolicy get policy;
  List<RequestedCard> get requestedCards;
  @override
  bool get isFirstInteractionWithRelyingParty;
  @override
  List<LocalizedString> get requestPurpose;
  @override
  @JsonKey(ignore: true)
  _$$StartDisclosureResult_RequestImplCopyWith<_$StartDisclosureResult_RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartDisclosureResult_RequestAttributesMissingImplCopyWith<$Res>
    implements $StartDisclosureResultCopyWith<$Res> {
  factory _$$StartDisclosureResult_RequestAttributesMissingImplCopyWith(
          _$StartDisclosureResult_RequestAttributesMissingImpl value,
          $Res Function(_$StartDisclosureResult_RequestAttributesMissingImpl) then) =
      __$$StartDisclosureResult_RequestAttributesMissingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Organization relyingParty,
      List<MissingAttribute> missingAttributes,
      bool isFirstInteractionWithRelyingParty,
      List<LocalizedString> requestPurpose});
}

/// @nodoc
class __$$StartDisclosureResult_RequestAttributesMissingImplCopyWithImpl<$Res>
    extends _$StartDisclosureResultCopyWithImpl<$Res, _$StartDisclosureResult_RequestAttributesMissingImpl>
    implements _$$StartDisclosureResult_RequestAttributesMissingImplCopyWith<$Res> {
  __$$StartDisclosureResult_RequestAttributesMissingImplCopyWithImpl(
      _$StartDisclosureResult_RequestAttributesMissingImpl _value,
      $Res Function(_$StartDisclosureResult_RequestAttributesMissingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relyingParty = null,
    Object? missingAttributes = null,
    Object? isFirstInteractionWithRelyingParty = null,
    Object? requestPurpose = null,
  }) {
    return _then(_$StartDisclosureResult_RequestAttributesMissingImpl(
      relyingParty: null == relyingParty
          ? _value.relyingParty
          : relyingParty // ignore: cast_nullable_to_non_nullable
              as Organization,
      missingAttributes: null == missingAttributes
          ? _value._missingAttributes
          : missingAttributes // ignore: cast_nullable_to_non_nullable
              as List<MissingAttribute>,
      isFirstInteractionWithRelyingParty: null == isFirstInteractionWithRelyingParty
          ? _value.isFirstInteractionWithRelyingParty
          : isFirstInteractionWithRelyingParty // ignore: cast_nullable_to_non_nullable
              as bool,
      requestPurpose: null == requestPurpose
          ? _value._requestPurpose
          : requestPurpose // ignore: cast_nullable_to_non_nullable
              as List<LocalizedString>,
    ));
  }
}

/// @nodoc

class _$StartDisclosureResult_RequestAttributesMissingImpl implements StartDisclosureResult_RequestAttributesMissing {
  const _$StartDisclosureResult_RequestAttributesMissingImpl(
      {required this.relyingParty,
      required final List<MissingAttribute> missingAttributes,
      required this.isFirstInteractionWithRelyingParty,
      required final List<LocalizedString> requestPurpose})
      : _missingAttributes = missingAttributes,
        _requestPurpose = requestPurpose;

  @override
  final Organization relyingParty;
  final List<MissingAttribute> _missingAttributes;
  @override
  List<MissingAttribute> get missingAttributes {
    if (_missingAttributes is EqualUnmodifiableListView) return _missingAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missingAttributes);
  }

  @override
  final bool isFirstInteractionWithRelyingParty;
  final List<LocalizedString> _requestPurpose;
  @override
  List<LocalizedString> get requestPurpose {
    if (_requestPurpose is EqualUnmodifiableListView) return _requestPurpose;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestPurpose);
  }

  @override
  String toString() {
    return 'StartDisclosureResult.requestAttributesMissing(relyingParty: $relyingParty, missingAttributes: $missingAttributes, isFirstInteractionWithRelyingParty: $isFirstInteractionWithRelyingParty, requestPurpose: $requestPurpose)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartDisclosureResult_RequestAttributesMissingImpl &&
            (identical(other.relyingParty, relyingParty) || other.relyingParty == relyingParty) &&
            const DeepCollectionEquality().equals(other._missingAttributes, _missingAttributes) &&
            (identical(other.isFirstInteractionWithRelyingParty, isFirstInteractionWithRelyingParty) ||
                other.isFirstInteractionWithRelyingParty == isFirstInteractionWithRelyingParty) &&
            const DeepCollectionEquality().equals(other._requestPurpose, _requestPurpose));
  }

  @override
  int get hashCode => Object.hash(runtimeType, relyingParty, const DeepCollectionEquality().hash(_missingAttributes),
      isFirstInteractionWithRelyingParty, const DeepCollectionEquality().hash(_requestPurpose));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartDisclosureResult_RequestAttributesMissingImplCopyWith<_$StartDisclosureResult_RequestAttributesMissingImpl>
      get copyWith => __$$StartDisclosureResult_RequestAttributesMissingImplCopyWithImpl<
          _$StartDisclosureResult_RequestAttributesMissingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)
        request,
    required TResult Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)
        requestAttributesMissing,
  }) {
    return requestAttributesMissing(
        relyingParty, missingAttributes, isFirstInteractionWithRelyingParty, requestPurpose);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        request,
    TResult? Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        requestAttributesMissing,
  }) {
    return requestAttributesMissing?.call(
        relyingParty, missingAttributes, isFirstInteractionWithRelyingParty, requestPurpose);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Organization relyingParty, RequestPolicy policy, List<RequestedCard> requestedCards,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        request,
    TResult Function(Organization relyingParty, List<MissingAttribute> missingAttributes,
            bool isFirstInteractionWithRelyingParty, List<LocalizedString> requestPurpose)?
        requestAttributesMissing,
    required TResult orElse(),
  }) {
    if (requestAttributesMissing != null) {
      return requestAttributesMissing(
          relyingParty, missingAttributes, isFirstInteractionWithRelyingParty, requestPurpose);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartDisclosureResult_Request value) request,
    required TResult Function(StartDisclosureResult_RequestAttributesMissing value) requestAttributesMissing,
  }) {
    return requestAttributesMissing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartDisclosureResult_Request value)? request,
    TResult? Function(StartDisclosureResult_RequestAttributesMissing value)? requestAttributesMissing,
  }) {
    return requestAttributesMissing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartDisclosureResult_Request value)? request,
    TResult Function(StartDisclosureResult_RequestAttributesMissing value)? requestAttributesMissing,
    required TResult orElse(),
  }) {
    if (requestAttributesMissing != null) {
      return requestAttributesMissing(this);
    }
    return orElse();
  }
}

abstract class StartDisclosureResult_RequestAttributesMissing implements StartDisclosureResult {
  const factory StartDisclosureResult_RequestAttributesMissing(
      {required final Organization relyingParty,
      required final List<MissingAttribute> missingAttributes,
      required final bool isFirstInteractionWithRelyingParty,
      required final List<LocalizedString> requestPurpose}) = _$StartDisclosureResult_RequestAttributesMissingImpl;

  @override
  Organization get relyingParty;
  List<MissingAttribute> get missingAttributes;
  @override
  bool get isFirstInteractionWithRelyingParty;
  @override
  List<LocalizedString> get requestPurpose;
  @override
  @JsonKey(ignore: true)
  _$$StartDisclosureResult_RequestAttributesMissingImplCopyWith<_$StartDisclosureResult_RequestAttributesMissingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletEvent {
  String get dateTime => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)
        disclosure,
    required TResult Function(String dateTime, Organization issuer, Card card) issuance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)?
        disclosure,
    TResult? Function(String dateTime, Organization issuer, Card card)? issuance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)?
        disclosure,
    TResult Function(String dateTime, Organization issuer, Card card)? issuance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEvent_Disclosure value) disclosure,
    required TResult Function(WalletEvent_Issuance value) issuance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEvent_Disclosure value)? disclosure,
    TResult? Function(WalletEvent_Issuance value)? issuance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEvent_Disclosure value)? disclosure,
    TResult Function(WalletEvent_Issuance value)? issuance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletEventCopyWith<WalletEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEventCopyWith<$Res> {
  factory $WalletEventCopyWith(WalletEvent value, $Res Function(WalletEvent) then) =
      _$WalletEventCopyWithImpl<$Res, WalletEvent>;
  @useResult
  $Res call({String dateTime});
}

/// @nodoc
class _$WalletEventCopyWithImpl<$Res, $Val extends WalletEvent> implements $WalletEventCopyWith<$Res> {
  _$WalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletEvent_DisclosureImplCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory _$$WalletEvent_DisclosureImplCopyWith(
          _$WalletEvent_DisclosureImpl value, $Res Function(_$WalletEvent_DisclosureImpl) then) =
      __$$WalletEvent_DisclosureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateTime,
      Organization relyingParty,
      List<LocalizedString> purpose,
      List<RequestedCard> requestedCards,
      RequestPolicy requestPolicy,
      DisclosureStatus status});
}

/// @nodoc
class __$$WalletEvent_DisclosureImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$WalletEvent_DisclosureImpl>
    implements _$$WalletEvent_DisclosureImplCopyWith<$Res> {
  __$$WalletEvent_DisclosureImplCopyWithImpl(
      _$WalletEvent_DisclosureImpl _value, $Res Function(_$WalletEvent_DisclosureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? relyingParty = null,
    Object? purpose = null,
    Object? requestedCards = null,
    Object? requestPolicy = null,
    Object? status = null,
  }) {
    return _then(_$WalletEvent_DisclosureImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      relyingParty: null == relyingParty
          ? _value.relyingParty
          : relyingParty // ignore: cast_nullable_to_non_nullable
              as Organization,
      purpose: null == purpose
          ? _value._purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as List<LocalizedString>,
      requestedCards: null == requestedCards
          ? _value._requestedCards
          : requestedCards // ignore: cast_nullable_to_non_nullable
              as List<RequestedCard>,
      requestPolicy: null == requestPolicy
          ? _value.requestPolicy
          : requestPolicy // ignore: cast_nullable_to_non_nullable
              as RequestPolicy,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DisclosureStatus,
    ));
  }
}

/// @nodoc

class _$WalletEvent_DisclosureImpl implements WalletEvent_Disclosure {
  const _$WalletEvent_DisclosureImpl(
      {required this.dateTime,
      required this.relyingParty,
      required final List<LocalizedString> purpose,
      required final List<RequestedCard> requestedCards,
      required this.requestPolicy,
      required this.status})
      : _purpose = purpose,
        _requestedCards = requestedCards;

  @override
  final String dateTime;
  @override
  final Organization relyingParty;
  final List<LocalizedString> _purpose;
  @override
  List<LocalizedString> get purpose {
    if (_purpose is EqualUnmodifiableListView) return _purpose;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purpose);
  }

  final List<RequestedCard> _requestedCards;
  @override
  List<RequestedCard> get requestedCards {
    if (_requestedCards is EqualUnmodifiableListView) return _requestedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestedCards);
  }

  @override
  final RequestPolicy requestPolicy;
  @override
  final DisclosureStatus status;

  @override
  String toString() {
    return 'WalletEvent.disclosure(dateTime: $dateTime, relyingParty: $relyingParty, purpose: $purpose, requestedCards: $requestedCards, requestPolicy: $requestPolicy, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEvent_DisclosureImpl &&
            (identical(other.dateTime, dateTime) || other.dateTime == dateTime) &&
            (identical(other.relyingParty, relyingParty) || other.relyingParty == relyingParty) &&
            const DeepCollectionEquality().equals(other._purpose, _purpose) &&
            const DeepCollectionEquality().equals(other._requestedCards, _requestedCards) &&
            (identical(other.requestPolicy, requestPolicy) || other.requestPolicy == requestPolicy) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, relyingParty, const DeepCollectionEquality().hash(_purpose),
      const DeepCollectionEquality().hash(_requestedCards), requestPolicy, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEvent_DisclosureImplCopyWith<_$WalletEvent_DisclosureImpl> get copyWith =>
      __$$WalletEvent_DisclosureImplCopyWithImpl<_$WalletEvent_DisclosureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)
        disclosure,
    required TResult Function(String dateTime, Organization issuer, Card card) issuance,
  }) {
    return disclosure(dateTime, relyingParty, purpose, requestedCards, requestPolicy, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)?
        disclosure,
    TResult? Function(String dateTime, Organization issuer, Card card)? issuance,
  }) {
    return disclosure?.call(dateTime, relyingParty, purpose, requestedCards, requestPolicy, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)?
        disclosure,
    TResult Function(String dateTime, Organization issuer, Card card)? issuance,
    required TResult orElse(),
  }) {
    if (disclosure != null) {
      return disclosure(dateTime, relyingParty, purpose, requestedCards, requestPolicy, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEvent_Disclosure value) disclosure,
    required TResult Function(WalletEvent_Issuance value) issuance,
  }) {
    return disclosure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEvent_Disclosure value)? disclosure,
    TResult? Function(WalletEvent_Issuance value)? issuance,
  }) {
    return disclosure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEvent_Disclosure value)? disclosure,
    TResult Function(WalletEvent_Issuance value)? issuance,
    required TResult orElse(),
  }) {
    if (disclosure != null) {
      return disclosure(this);
    }
    return orElse();
  }
}

abstract class WalletEvent_Disclosure implements WalletEvent {
  const factory WalletEvent_Disclosure(
      {required final String dateTime,
      required final Organization relyingParty,
      required final List<LocalizedString> purpose,
      required final List<RequestedCard> requestedCards,
      required final RequestPolicy requestPolicy,
      required final DisclosureStatus status}) = _$WalletEvent_DisclosureImpl;

  @override
  String get dateTime;
  Organization get relyingParty;
  List<LocalizedString> get purpose;
  List<RequestedCard> get requestedCards;
  RequestPolicy get requestPolicy;
  DisclosureStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$WalletEvent_DisclosureImplCopyWith<_$WalletEvent_DisclosureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletEvent_IssuanceImplCopyWith<$Res> implements $WalletEventCopyWith<$Res> {
  factory _$$WalletEvent_IssuanceImplCopyWith(
          _$WalletEvent_IssuanceImpl value, $Res Function(_$WalletEvent_IssuanceImpl) then) =
      __$$WalletEvent_IssuanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dateTime, Organization issuer, Card card});
}

/// @nodoc
class __$$WalletEvent_IssuanceImplCopyWithImpl<$Res> extends _$WalletEventCopyWithImpl<$Res, _$WalletEvent_IssuanceImpl>
    implements _$$WalletEvent_IssuanceImplCopyWith<$Res> {
  __$$WalletEvent_IssuanceImplCopyWithImpl(
      _$WalletEvent_IssuanceImpl _value, $Res Function(_$WalletEvent_IssuanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? issuer = null,
    Object? card = null,
  }) {
    return _then(_$WalletEvent_IssuanceImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as Organization,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Card,
    ));
  }
}

/// @nodoc

class _$WalletEvent_IssuanceImpl implements WalletEvent_Issuance {
  const _$WalletEvent_IssuanceImpl({required this.dateTime, required this.issuer, required this.card});

  @override
  final String dateTime;
  @override
  final Organization issuer;
  @override
  final Card card;

  @override
  String toString() {
    return 'WalletEvent.issuance(dateTime: $dateTime, issuer: $issuer, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEvent_IssuanceImpl &&
            (identical(other.dateTime, dateTime) || other.dateTime == dateTime) &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, issuer, card);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEvent_IssuanceImplCopyWith<_$WalletEvent_IssuanceImpl> get copyWith =>
      __$$WalletEvent_IssuanceImplCopyWithImpl<_$WalletEvent_IssuanceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)
        disclosure,
    required TResult Function(String dateTime, Organization issuer, Card card) issuance,
  }) {
    return issuance(dateTime, issuer, card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)?
        disclosure,
    TResult? Function(String dateTime, Organization issuer, Card card)? issuance,
  }) {
    return issuance?.call(dateTime, issuer, card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dateTime, Organization relyingParty, List<LocalizedString> purpose,
            List<RequestedCard> requestedCards, RequestPolicy requestPolicy, DisclosureStatus status)?
        disclosure,
    TResult Function(String dateTime, Organization issuer, Card card)? issuance,
    required TResult orElse(),
  }) {
    if (issuance != null) {
      return issuance(dateTime, issuer, card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEvent_Disclosure value) disclosure,
    required TResult Function(WalletEvent_Issuance value) issuance,
  }) {
    return issuance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEvent_Disclosure value)? disclosure,
    TResult? Function(WalletEvent_Issuance value)? issuance,
  }) {
    return issuance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEvent_Disclosure value)? disclosure,
    TResult Function(WalletEvent_Issuance value)? issuance,
    required TResult orElse(),
  }) {
    if (issuance != null) {
      return issuance(this);
    }
    return orElse();
  }
}

abstract class WalletEvent_Issuance implements WalletEvent {
  const factory WalletEvent_Issuance(
      {required final String dateTime,
      required final Organization issuer,
      required final Card card}) = _$WalletEvent_IssuanceImpl;

  @override
  String get dateTime;
  Organization get issuer;
  Card get card;
  @override
  @JsonKey(ignore: true)
  _$$WalletEvent_IssuanceImplCopyWith<_$WalletEvent_IssuanceImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletInstructionResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function(int leftoverAttempts, bool isFinalAttempt) incorrectPin,
    required TResult Function(int timeoutMillis) timeout,
    required TResult Function() blocked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ok,
    TResult? Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult? Function(int timeoutMillis)? timeout,
    TResult? Function()? blocked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult Function(int timeoutMillis)? timeout,
    TResult Function()? blocked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletInstructionResult_Ok value) ok,
    required TResult Function(WalletInstructionResult_IncorrectPin value) incorrectPin,
    required TResult Function(WalletInstructionResult_Timeout value) timeout,
    required TResult Function(WalletInstructionResult_Blocked value) blocked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletInstructionResult_Ok value)? ok,
    TResult? Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult? Function(WalletInstructionResult_Timeout value)? timeout,
    TResult? Function(WalletInstructionResult_Blocked value)? blocked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletInstructionResult_Ok value)? ok,
    TResult Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult Function(WalletInstructionResult_Timeout value)? timeout,
    TResult Function(WalletInstructionResult_Blocked value)? blocked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletInstructionResultCopyWith<$Res> {
  factory $WalletInstructionResultCopyWith(WalletInstructionResult value, $Res Function(WalletInstructionResult) then) =
      _$WalletInstructionResultCopyWithImpl<$Res, WalletInstructionResult>;
}

/// @nodoc
class _$WalletInstructionResultCopyWithImpl<$Res, $Val extends WalletInstructionResult>
    implements $WalletInstructionResultCopyWith<$Res> {
  _$WalletInstructionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WalletInstructionResult_OkImplCopyWith<$Res> {
  factory _$$WalletInstructionResult_OkImplCopyWith(
          _$WalletInstructionResult_OkImpl value, $Res Function(_$WalletInstructionResult_OkImpl) then) =
      __$$WalletInstructionResult_OkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletInstructionResult_OkImplCopyWithImpl<$Res>
    extends _$WalletInstructionResultCopyWithImpl<$Res, _$WalletInstructionResult_OkImpl>
    implements _$$WalletInstructionResult_OkImplCopyWith<$Res> {
  __$$WalletInstructionResult_OkImplCopyWithImpl(
      _$WalletInstructionResult_OkImpl _value, $Res Function(_$WalletInstructionResult_OkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WalletInstructionResult_OkImpl implements WalletInstructionResult_Ok {
  const _$WalletInstructionResult_OkImpl();

  @override
  String toString() {
    return 'WalletInstructionResult.ok()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$WalletInstructionResult_OkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function(int leftoverAttempts, bool isFinalAttempt) incorrectPin,
    required TResult Function(int timeoutMillis) timeout,
    required TResult Function() blocked,
  }) {
    return ok();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ok,
    TResult? Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult? Function(int timeoutMillis)? timeout,
    TResult? Function()? blocked,
  }) {
    return ok?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult Function(int timeoutMillis)? timeout,
    TResult Function()? blocked,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletInstructionResult_Ok value) ok,
    required TResult Function(WalletInstructionResult_IncorrectPin value) incorrectPin,
    required TResult Function(WalletInstructionResult_Timeout value) timeout,
    required TResult Function(WalletInstructionResult_Blocked value) blocked,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletInstructionResult_Ok value)? ok,
    TResult? Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult? Function(WalletInstructionResult_Timeout value)? timeout,
    TResult? Function(WalletInstructionResult_Blocked value)? blocked,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletInstructionResult_Ok value)? ok,
    TResult Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult Function(WalletInstructionResult_Timeout value)? timeout,
    TResult Function(WalletInstructionResult_Blocked value)? blocked,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class WalletInstructionResult_Ok implements WalletInstructionResult {
  const factory WalletInstructionResult_Ok() = _$WalletInstructionResult_OkImpl;
}

/// @nodoc
abstract class _$$WalletInstructionResult_IncorrectPinImplCopyWith<$Res> {
  factory _$$WalletInstructionResult_IncorrectPinImplCopyWith(_$WalletInstructionResult_IncorrectPinImpl value,
          $Res Function(_$WalletInstructionResult_IncorrectPinImpl) then) =
      __$$WalletInstructionResult_IncorrectPinImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int leftoverAttempts, bool isFinalAttempt});
}

/// @nodoc
class __$$WalletInstructionResult_IncorrectPinImplCopyWithImpl<$Res>
    extends _$WalletInstructionResultCopyWithImpl<$Res, _$WalletInstructionResult_IncorrectPinImpl>
    implements _$$WalletInstructionResult_IncorrectPinImplCopyWith<$Res> {
  __$$WalletInstructionResult_IncorrectPinImplCopyWithImpl(_$WalletInstructionResult_IncorrectPinImpl _value,
      $Res Function(_$WalletInstructionResult_IncorrectPinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftoverAttempts = null,
    Object? isFinalAttempt = null,
  }) {
    return _then(_$WalletInstructionResult_IncorrectPinImpl(
      leftoverAttempts: null == leftoverAttempts
          ? _value.leftoverAttempts
          : leftoverAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      isFinalAttempt: null == isFinalAttempt
          ? _value.isFinalAttempt
          : isFinalAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WalletInstructionResult_IncorrectPinImpl implements WalletInstructionResult_IncorrectPin {
  const _$WalletInstructionResult_IncorrectPinImpl({required this.leftoverAttempts, required this.isFinalAttempt});

  @override
  final int leftoverAttempts;
  @override
  final bool isFinalAttempt;

  @override
  String toString() {
    return 'WalletInstructionResult.incorrectPin(leftoverAttempts: $leftoverAttempts, isFinalAttempt: $isFinalAttempt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletInstructionResult_IncorrectPinImpl &&
            (identical(other.leftoverAttempts, leftoverAttempts) || other.leftoverAttempts == leftoverAttempts) &&
            (identical(other.isFinalAttempt, isFinalAttempt) || other.isFinalAttempt == isFinalAttempt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, leftoverAttempts, isFinalAttempt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletInstructionResult_IncorrectPinImplCopyWith<_$WalletInstructionResult_IncorrectPinImpl> get copyWith =>
      __$$WalletInstructionResult_IncorrectPinImplCopyWithImpl<_$WalletInstructionResult_IncorrectPinImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function(int leftoverAttempts, bool isFinalAttempt) incorrectPin,
    required TResult Function(int timeoutMillis) timeout,
    required TResult Function() blocked,
  }) {
    return incorrectPin(leftoverAttempts, isFinalAttempt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ok,
    TResult? Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult? Function(int timeoutMillis)? timeout,
    TResult? Function()? blocked,
  }) {
    return incorrectPin?.call(leftoverAttempts, isFinalAttempt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult Function(int timeoutMillis)? timeout,
    TResult Function()? blocked,
    required TResult orElse(),
  }) {
    if (incorrectPin != null) {
      return incorrectPin(leftoverAttempts, isFinalAttempt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletInstructionResult_Ok value) ok,
    required TResult Function(WalletInstructionResult_IncorrectPin value) incorrectPin,
    required TResult Function(WalletInstructionResult_Timeout value) timeout,
    required TResult Function(WalletInstructionResult_Blocked value) blocked,
  }) {
    return incorrectPin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletInstructionResult_Ok value)? ok,
    TResult? Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult? Function(WalletInstructionResult_Timeout value)? timeout,
    TResult? Function(WalletInstructionResult_Blocked value)? blocked,
  }) {
    return incorrectPin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletInstructionResult_Ok value)? ok,
    TResult Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult Function(WalletInstructionResult_Timeout value)? timeout,
    TResult Function(WalletInstructionResult_Blocked value)? blocked,
    required TResult orElse(),
  }) {
    if (incorrectPin != null) {
      return incorrectPin(this);
    }
    return orElse();
  }
}

abstract class WalletInstructionResult_IncorrectPin implements WalletInstructionResult {
  const factory WalletInstructionResult_IncorrectPin(
      {required final int leftoverAttempts,
      required final bool isFinalAttempt}) = _$WalletInstructionResult_IncorrectPinImpl;

  int get leftoverAttempts;
  bool get isFinalAttempt;
  @JsonKey(ignore: true)
  _$$WalletInstructionResult_IncorrectPinImplCopyWith<_$WalletInstructionResult_IncorrectPinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletInstructionResult_TimeoutImplCopyWith<$Res> {
  factory _$$WalletInstructionResult_TimeoutImplCopyWith(
          _$WalletInstructionResult_TimeoutImpl value, $Res Function(_$WalletInstructionResult_TimeoutImpl) then) =
      __$$WalletInstructionResult_TimeoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int timeoutMillis});
}

/// @nodoc
class __$$WalletInstructionResult_TimeoutImplCopyWithImpl<$Res>
    extends _$WalletInstructionResultCopyWithImpl<$Res, _$WalletInstructionResult_TimeoutImpl>
    implements _$$WalletInstructionResult_TimeoutImplCopyWith<$Res> {
  __$$WalletInstructionResult_TimeoutImplCopyWithImpl(
      _$WalletInstructionResult_TimeoutImpl _value, $Res Function(_$WalletInstructionResult_TimeoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeoutMillis = null,
  }) {
    return _then(_$WalletInstructionResult_TimeoutImpl(
      timeoutMillis: null == timeoutMillis
          ? _value.timeoutMillis
          : timeoutMillis // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WalletInstructionResult_TimeoutImpl implements WalletInstructionResult_Timeout {
  const _$WalletInstructionResult_TimeoutImpl({required this.timeoutMillis});

  @override
  final int timeoutMillis;

  @override
  String toString() {
    return 'WalletInstructionResult.timeout(timeoutMillis: $timeoutMillis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletInstructionResult_TimeoutImpl &&
            (identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeoutMillis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletInstructionResult_TimeoutImplCopyWith<_$WalletInstructionResult_TimeoutImpl> get copyWith =>
      __$$WalletInstructionResult_TimeoutImplCopyWithImpl<_$WalletInstructionResult_TimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function(int leftoverAttempts, bool isFinalAttempt) incorrectPin,
    required TResult Function(int timeoutMillis) timeout,
    required TResult Function() blocked,
  }) {
    return timeout(timeoutMillis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ok,
    TResult? Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult? Function(int timeoutMillis)? timeout,
    TResult? Function()? blocked,
  }) {
    return timeout?.call(timeoutMillis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult Function(int timeoutMillis)? timeout,
    TResult Function()? blocked,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(timeoutMillis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletInstructionResult_Ok value) ok,
    required TResult Function(WalletInstructionResult_IncorrectPin value) incorrectPin,
    required TResult Function(WalletInstructionResult_Timeout value) timeout,
    required TResult Function(WalletInstructionResult_Blocked value) blocked,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletInstructionResult_Ok value)? ok,
    TResult? Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult? Function(WalletInstructionResult_Timeout value)? timeout,
    TResult? Function(WalletInstructionResult_Blocked value)? blocked,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletInstructionResult_Ok value)? ok,
    TResult Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult Function(WalletInstructionResult_Timeout value)? timeout,
    TResult Function(WalletInstructionResult_Blocked value)? blocked,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class WalletInstructionResult_Timeout implements WalletInstructionResult {
  const factory WalletInstructionResult_Timeout({required final int timeoutMillis}) =
      _$WalletInstructionResult_TimeoutImpl;

  int get timeoutMillis;
  @JsonKey(ignore: true)
  _$$WalletInstructionResult_TimeoutImplCopyWith<_$WalletInstructionResult_TimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletInstructionResult_BlockedImplCopyWith<$Res> {
  factory _$$WalletInstructionResult_BlockedImplCopyWith(
          _$WalletInstructionResult_BlockedImpl value, $Res Function(_$WalletInstructionResult_BlockedImpl) then) =
      __$$WalletInstructionResult_BlockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WalletInstructionResult_BlockedImplCopyWithImpl<$Res>
    extends _$WalletInstructionResultCopyWithImpl<$Res, _$WalletInstructionResult_BlockedImpl>
    implements _$$WalletInstructionResult_BlockedImplCopyWith<$Res> {
  __$$WalletInstructionResult_BlockedImplCopyWithImpl(
      _$WalletInstructionResult_BlockedImpl _value, $Res Function(_$WalletInstructionResult_BlockedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WalletInstructionResult_BlockedImpl implements WalletInstructionResult_Blocked {
  const _$WalletInstructionResult_BlockedImpl();

  @override
  String toString() {
    return 'WalletInstructionResult.blocked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WalletInstructionResult_BlockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ok,
    required TResult Function(int leftoverAttempts, bool isFinalAttempt) incorrectPin,
    required TResult Function(int timeoutMillis) timeout,
    required TResult Function() blocked,
  }) {
    return blocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ok,
    TResult? Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult? Function(int timeoutMillis)? timeout,
    TResult? Function()? blocked,
  }) {
    return blocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ok,
    TResult Function(int leftoverAttempts, bool isFinalAttempt)? incorrectPin,
    TResult Function(int timeoutMillis)? timeout,
    TResult Function()? blocked,
    required TResult orElse(),
  }) {
    if (blocked != null) {
      return blocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletInstructionResult_Ok value) ok,
    required TResult Function(WalletInstructionResult_IncorrectPin value) incorrectPin,
    required TResult Function(WalletInstructionResult_Timeout value) timeout,
    required TResult Function(WalletInstructionResult_Blocked value) blocked,
  }) {
    return blocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletInstructionResult_Ok value)? ok,
    TResult? Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult? Function(WalletInstructionResult_Timeout value)? timeout,
    TResult? Function(WalletInstructionResult_Blocked value)? blocked,
  }) {
    return blocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletInstructionResult_Ok value)? ok,
    TResult Function(WalletInstructionResult_IncorrectPin value)? incorrectPin,
    TResult Function(WalletInstructionResult_Timeout value)? timeout,
    TResult Function(WalletInstructionResult_Blocked value)? blocked,
    required TResult orElse(),
  }) {
    if (blocked != null) {
      return blocked(this);
    }
    return orElse();
  }
}

abstract class WalletInstructionResult_Blocked implements WalletInstructionResult {
  const factory WalletInstructionResult_Blocked() = _$WalletInstructionResult_BlockedImpl;
}
