import 'package:json_annotation/json_annotation.dart';
part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String username;
  final String password;

  LoginRequestDto(this.username, this.password);

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
