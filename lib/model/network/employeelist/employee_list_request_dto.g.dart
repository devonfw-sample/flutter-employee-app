// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeListRequestDto _$EmployeeListRequestDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeListRequestDto(
    json['employeeId'] as String,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
    json['pageable'] == null
        ? null
        : PageableDto.fromJson(json['pageable'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EmployeeListRequestDtoToJson(
        EmployeeListRequestDto instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'pageable': instance.pageable,
    };
