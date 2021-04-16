import 'package:json_annotation/json_annotation.dart';
part 'employee_insert_request_dto.g.dart';

@JsonSerializable()
class EmployeeInsertRequestDto {
  final String name;
  final String surname;
  final String email;

  EmployeeInsertRequestDto(this.name, this.surname, this.email);

  factory EmployeeInsertRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInsertRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInsertRequestDtoToJson(this);
}
