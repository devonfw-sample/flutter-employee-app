// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) {
  return LoginRequestDto(
    json['j_username'] as String,
    json['j_password'] as String,
  );
}

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'j_username': instance.j_username,
      'j_password': instance.j_password,
    };
