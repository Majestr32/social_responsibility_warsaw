// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollectionEntity _$CollectionEntityFromJson(Map<String, dynamic> json) {
  return _CollectionEntity.fromJson(json);
}

/// @nodoc
mixin _$CollectionEntity {
  String get id => throw _privateConstructorUsedError;
  String get collectionName => throw _privateConstructorUsedError;
  int get cardsCount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int get cardsLearned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionEntityCopyWith<CollectionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionEntityCopyWith<$Res> {
  factory $CollectionEntityCopyWith(
          CollectionEntity value, $Res Function(CollectionEntity) then) =
      _$CollectionEntityCopyWithImpl<$Res, CollectionEntity>;
  @useResult
  $Res call(
      {String id,
      String collectionName,
      int cardsCount,
      @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
      DateTime? createdAt,
      int cardsLearned});
}

/// @nodoc
class _$CollectionEntityCopyWithImpl<$Res, $Val extends CollectionEntity>
    implements $CollectionEntityCopyWith<$Res> {
  _$CollectionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionName = null,
    Object? cardsCount = null,
    Object? createdAt = freezed,
    Object? cardsLearned = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      cardsCount: null == cardsCount
          ? _value.cardsCount
          : cardsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cardsLearned: null == cardsLearned
          ? _value.cardsLearned
          : cardsLearned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionEntityImplCopyWith<$Res>
    implements $CollectionEntityCopyWith<$Res> {
  factory _$$CollectionEntityImplCopyWith(_$CollectionEntityImpl value,
          $Res Function(_$CollectionEntityImpl) then) =
      __$$CollectionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String collectionName,
      int cardsCount,
      @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
      DateTime? createdAt,
      int cardsLearned});
}

/// @nodoc
class __$$CollectionEntityImplCopyWithImpl<$Res>
    extends _$CollectionEntityCopyWithImpl<$Res, _$CollectionEntityImpl>
    implements _$$CollectionEntityImplCopyWith<$Res> {
  __$$CollectionEntityImplCopyWithImpl(_$CollectionEntityImpl _value,
      $Res Function(_$CollectionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionName = null,
    Object? cardsCount = null,
    Object? createdAt = freezed,
    Object? cardsLearned = null,
  }) {
    return _then(_$CollectionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      cardsCount: null == cardsCount
          ? _value.cardsCount
          : cardsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cardsLearned: null == cardsLearned
          ? _value.cardsLearned
          : cardsLearned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionEntityImpl implements _CollectionEntity {
  _$CollectionEntityImpl(
      {required this.id,
      required this.collectionName,
      this.cardsCount = 0,
      @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
      required this.createdAt,
      this.cardsLearned = 0});

  factory _$CollectionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String collectionName;
  @override
  @JsonKey()
  final int cardsCount;
  @override
  @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey()
  final int cardsLearned;

  @override
  String toString() {
    return 'CollectionEntity(id: $id, collectionName: $collectionName, cardsCount: $cardsCount, createdAt: $createdAt, cardsLearned: $cardsLearned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.cardsCount, cardsCount) ||
                other.cardsCount == cardsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.cardsLearned, cardsLearned) ||
                other.cardsLearned == cardsLearned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, collectionName, cardsCount, createdAt, cardsLearned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionEntityImplCopyWith<_$CollectionEntityImpl> get copyWith =>
      __$$CollectionEntityImplCopyWithImpl<_$CollectionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionEntityImplToJson(
      this,
    );
  }
}

abstract class _CollectionEntity implements CollectionEntity {
  factory _CollectionEntity(
      {required final String id,
      required final String collectionName,
      final int cardsCount,
      @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
      required final DateTime? createdAt,
      final int cardsLearned}) = _$CollectionEntityImpl;

  factory _CollectionEntity.fromJson(Map<String, dynamic> json) =
      _$CollectionEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get collectionName;
  @override
  int get cardsCount;
  @override
  @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
  DateTime? get createdAt;
  @override
  int get cardsLearned;
  @override
  @JsonKey(ignore: true)
  _$$CollectionEntityImplCopyWith<_$CollectionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
