import 'package:json_annotation/json_annotation.dart';
part 'employee_detail_response_dto.g.dart';

@JsonSerializable()
class EmployeeDetailResponseDto {
  final int modificationCounter;
  final int id;
  final int employeeId;
  final String name;
  final String surname;
  final String email;

  EmployeeDetailResponseDto(this.modificationCounter, this.id, this.employeeId, this.name, this.surname, this.email);

  factory EmployeeDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDetailResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDetailResponseDtoToJson(this);
}
