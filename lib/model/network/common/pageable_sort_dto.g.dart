// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_sort_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableSortDto _$PageableSortDtoFromJson(Map<String, dynamic> json) {
  return PageableSortDto(
    json['property'] as String,
    json['direction'] as String,
  );
}

Map<String, dynamic> _$PageableSortDtoToJson(PageableSortDto instance) =>
    <String, dynamic>{
      'property': instance.property,
      'direction': instance.direction,
    };
