import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

part 'user_data.freezed.dart';

@Freezed(fromJson: true, toJson: true)
class UserData with _$UserData {
  const factory UserData({
    @JsonKey() required String username,
    @JsonKey() required String email,
    @JsonKey() required String id,
  }) = _UserData;

  const UserData._();

  factory UserData.fromJson(Map<String, Object?> json) => _$UserDataFromJson(json);
}
