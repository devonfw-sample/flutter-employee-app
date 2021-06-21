import 'package:json_annotation/json_annotation.dart';
part 'employee_update_response_dto.g.dart';

@JsonSerializable()
class EmployeeUpdateResponseDto {
  final int modificationCounter;
  final int id;
  final String name;
  final String surname;
  final String email;

  EmployeeUpdateResponseDto(
      this.modificationCounter, this.id, this.name, this.surname, this.email);

  factory EmployeeUpdateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUpdateResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeUpdateResponseDtoToJson(this);
}
