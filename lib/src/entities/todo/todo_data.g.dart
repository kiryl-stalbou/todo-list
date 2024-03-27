// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoDataImpl _$$TodoDataImplFromJson(Map<String, dynamic> json) =>
    _$TodoDataImpl(
      title: json['title'] as String,
      notes: json['notes'] as String,
      dateTime:
          const TimestampSerializer().fromJson(json['dateTime'] as Timestamp),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$TodoDataImplToJson(_$TodoDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'notes': instance.notes,
      'dateTime': const TimestampSerializer().toJson(instance.dateTime),
      'isCompleted': instance.isCompleted,
    };
