// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponseResponseDto _$TokenResponseResponseDtoFromJson(
    Map<String, dynamic> json) {
  return TokenResponseResponseDto(
    json['token'] as String,
    json['parameterName'] as String,
    json['headerName'] as String,
  );
}

Map<String, dynamic> _$TokenResponseResponseDtoToJson(
        TokenResponseResponseDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'parameterName': instance.parameterName,
      'headerName': instance.headerName,
    };
