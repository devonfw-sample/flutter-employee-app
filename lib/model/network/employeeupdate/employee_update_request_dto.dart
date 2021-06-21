import 'package:json_annotation/json_annotation.dart';
part 'employee_update_request_dto.g.dart';

@JsonSerializable()
class EmployeeUpdateRequestDto {
  final String name;
  final String surname;
  final String email;

  EmployeeUpdateRequestDto(this.name, this.surname, this.email);

  factory EmployeeUpdateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUpdateRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeUpdateRequestDtoToJson(this);
}
