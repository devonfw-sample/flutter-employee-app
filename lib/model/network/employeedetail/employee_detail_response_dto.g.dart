// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDetailResponseDto _$EmployeeDetailResponseDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeDetailResponseDto(
    json['modificationCounter'] as int,
    json['id'] as int,
    json['employeeId'] as int,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$EmployeeDetailResponseDtoToJson(
        EmployeeDetailResponseDto instance) =>
    <String, dynamic>{
      'modificationCounter': instance.modificationCounter,
      'id': instance.id,
      'employeeId': instance.employeeId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
