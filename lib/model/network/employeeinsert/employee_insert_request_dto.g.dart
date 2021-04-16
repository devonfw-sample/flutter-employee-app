// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_insert_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInsertRequestDto _$EmployeeInsertRequestDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeInsertRequestDto(
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$EmployeeInsertRequestDtoToJson(
        EmployeeInsertRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
