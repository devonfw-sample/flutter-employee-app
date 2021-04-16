import 'package:devon4ng_flutter_application_template/model/network/common/pageable_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_content_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'employee_list_response_dto.g.dart';

@JsonSerializable()
class EmployeeListResponseDto {
  final List<EmployeeListContentResponseDto> content;
  final PageableDto pageable;
  final int totalElements;

  EmployeeListResponseDto(this.content, this.pageable, this.totalElements);

  factory EmployeeListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListResponseDtoToJson(this);
}
