// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoDataImpl _$$TodoDataImplFromJson(Map<String, dynamic> json) =>
    _$TodoDataImpl(
      title: json['title'] as String?,
      notes: json['notes'] as String?,
      dateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['dateTime'], const _TimestampSerializer().fromJson),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$TodoDataImplToJson(_$TodoDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'notes': instance.notes,
      'dateTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.dateTime, const _TimestampSerializer().toJson),
      'isCompleted': instance.isCompleted,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
