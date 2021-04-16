// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableDto _$PageableDtoFromJson(Map<String, dynamic> json) {
  return PageableDto(
    json['pageSize'] as int,
    json['pageNumber'] as int,
    (json['sort'] as List)
        ?.map((e) => e == null
            ? null
            : PageableSortDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PageableDtoToJson(PageableDto instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'sort': instance.sort,
    };
