// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list_content_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeListContentResponseDto _$EmployeeListContentResponseDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeListContentResponseDto(
    json['modificationCounter'] as int,
    json['id'] as int,
    json['employeeId'] as int,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$EmployeeListContentResponseDtoToJson(
        EmployeeListContentResponseDto instance) =>
    <String, dynamic>{
      'modificationCounter': instance.modificationCounter,
      'id': instance.id,
      'employeeId': instance.employeeId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };
