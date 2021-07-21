import 'package:devon4ng_flutter_application_template/model/network/common/pageable_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'employee_list_request_dto.g.dart';

@JsonSerializable()
class EmployeeListRequestDto {
  final int? employeeId;
  final String? name;
  final String? surname;
  final String? email;
  final PageableDto pageable;

  EmployeeListRequestDto(
      this.employeeId, this.name, this.surname, this.email, this.pageable);

  factory EmployeeListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListRequestDtoToJson(this);
}
