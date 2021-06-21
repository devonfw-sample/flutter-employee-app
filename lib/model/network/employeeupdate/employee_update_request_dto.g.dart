// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_update_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeUpdateRequestDto _$EmployeeUpdateRequestDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeUpdateRequestDto(
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$EmployeeUpdateRequestDtoToJson(
        EmployeeUpdateRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
