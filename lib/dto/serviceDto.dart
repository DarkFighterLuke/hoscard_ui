import 'package:json_annotation/json_annotation.dart';
part 'serviceDto.g.dart';

@JsonSerializable()
class ServiceDto {
  @JsonKey(name: "ServiceId")
  int serviceId;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Link")
  String? link;
  @JsonKey(name: "Icon")
  String? icon;
  @JsonKey(name: "Color")
  String? color;

  ServiceDto(
      {required this.serviceId, this.name, this.link, this.icon, this.color});
  factory ServiceDto.fromJson(Map<String, dynamic> json) => _$ServiceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceDtoToJson(this);
  
}
