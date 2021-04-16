// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_insert_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInsertResponseDto _$EmployeeInsertResponseDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeInsertResponseDto(
    json['modificationCounter'] as int,
    json['id'] as int,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$EmployeeInsertResponseDtoToJson(
        EmployeeInsertResponseDto instance) =>
    <String, dynamic>{
      'modificationCounter': instance.modificationCounter,
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
