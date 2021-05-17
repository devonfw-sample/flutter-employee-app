import 'package:json_annotation/json_annotation.dart';
part 'token_response_dto.g.dart';

@JsonSerializable()
class TokenResponseResponseDto {
  final String token;
  final String parameterName;
  final String headerName;

  TokenResponseResponseDto(this.token, this.parameterName, this.headerName);

  factory TokenResponseResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseResponseDtoToJson(this);
}
