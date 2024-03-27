import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_serializer.dart';

part 'todo_data.g.dart';

part 'todo_data.freezed.dart';

@Freezed(fromJson: true, toJson: true)
class TodoData with _$TodoData {
  const factory TodoData({
    @JsonKey() required String title,
    @JsonKey() required String notes,
    @TimestampSerializer() required DateTime dateTime,
    @JsonKey() required bool isCompleted,
  }) = _TodoData;

  const TodoData._();

  factory TodoData.fromJson(Map<String, Object?> json) => _$TodoDataFromJson(json);
}
