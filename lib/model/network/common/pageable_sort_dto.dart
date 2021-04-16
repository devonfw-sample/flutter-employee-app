import 'package:json_annotation/json_annotation.dart';
part 'pageable_sort_dto.g.dart';

@JsonSerializable()
class PageableSortDto {
  final String property;
  final String direction;

  PageableSortDto(this.property, this.direction);

  factory PageableSortDto.fromJson(Map<String, dynamic> json) =>
      _$PageableSortDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PageableSortDtoToJson(this);

  @override
  String toString() {
    return "(property: $property,direction: $direction)";
  }
}
