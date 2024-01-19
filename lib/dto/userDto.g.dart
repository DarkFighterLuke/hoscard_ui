// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      userId: json['UserId'] as int,
      username: json['Username'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'UserId': instance.userId,
      'Username': instance.username,
    };
