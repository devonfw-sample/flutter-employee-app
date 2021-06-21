// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_update_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeUpdateResponseDto _$EmployeeUpdateResponseDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeUpdateResponseDto(
    json['modificationCounter'] as int,
    json['id'] as int,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$EmployeeUpdateResponseDtoToJson(
        EmployeeUpdateResponseDto instance) =>
    <String, dynamic>{
      'modificationCounter': instance.modificationCounter,
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
