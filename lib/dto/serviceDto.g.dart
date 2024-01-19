// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => ServiceDto(
      serviceId: json['ServiceId'] as int,
      name: json['Name'] as String?,
      link: json['Link'] as String?,
      icon: json['Icon'] as String?,
      color: json['Color'] as String?,
    );

Map<String, dynamic> _$ServiceDtoToJson(ServiceDto instance) =>
    <String, dynamic>{
      'ServiceId': instance.serviceId,
      'Name': instance.name,
      'Link': instance.link,
      'Icon': instance.icon,
      'Color': instance.color,
    };
