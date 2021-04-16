import 'package:json_annotation/json_annotation.dart';
part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String j_username;
  final String j_password;

  LoginRequestDto(this.j_username, this.j_password);

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
