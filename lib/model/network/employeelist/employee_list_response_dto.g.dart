// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeListResponseDto _$EmployeeListResponseDtoFromJson(
    Map<String, dynamic> json) {
  return EmployeeListResponseDto(
    (json['content'] as List<dynamic>)
        .map((e) =>
            EmployeeListContentResponseDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    PageableDto.fromJson(json['pageable'] as Map<String, dynamic>),
    json['totalElements'] as int,
  );
}

Map<String, dynamic> _$EmployeeListResponseDtoToJson(
        EmployeeListResponseDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalElements': instance.totalElements,
    };
