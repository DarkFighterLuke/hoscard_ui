import 'package:json_annotation/json_annotation.dart';
part 'userDto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "UserId")
  int userId;
  @JsonKey(name: "Username")
  String username;

  UserDto({required this.userId, required this.username});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
