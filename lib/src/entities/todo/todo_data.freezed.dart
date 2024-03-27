// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoData _$TodoDataFromJson(Map<String, dynamic> json) {
  return _TodoData.fromJson(json);
}

/// @nodoc
mixin _$TodoData {
  @JsonKey()
  String get title => throw _privateConstructorUsedError;
  @JsonKey()
  String get notes => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey()
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$TodoDataImpl extends _TodoData {
  const _$TodoDataImpl(
      {@JsonKey() required this.title,
      @JsonKey() required this.notes,
      @TimestampSerializer() required this.dateTime,
      @JsonKey() required this.isCompleted})
      : super._();

  factory _$TodoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoDataImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String notes;
  @override
  @TimestampSerializer()
  final DateTime dateTime;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'TodoData(title: $title, notes: $notes, dateTime: $dateTime, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, notes, dateTime, isCompleted);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoDataImplToJson(
      this,
    );
  }
}

abstract class _TodoData extends TodoData {
  const factory _TodoData(
      {@JsonKey() required final String title,
      @JsonKey() required final String notes,
      @TimestampSerializer() required final DateTime dateTime,
      @JsonKey() required final bool isCompleted}) = _$TodoDataImpl;
  const _TodoData._() : super._();

  factory _TodoData.fromJson(Map<String, dynamic> json) =
      _$TodoDataImpl.fromJson;

  @override
  @JsonKey()
  String get title;
  @override
  @JsonKey()
  String get notes;
  @override
  @TimestampSerializer()
  DateTime get dateTime;
  @override
  @JsonKey()
  bool get isCompleted;
}
