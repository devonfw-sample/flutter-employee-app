import 'package:json_annotation/json_annotation.dart';
part 'employee_insert_response_dto.g.dart';

@JsonSerializable()
class EmployeeInsertResponseDto {
  final int modificationCounter;
  final int id;
  final String name;
  final String surname;
  final String email;

  EmployeeInsertResponseDto(
      this.modificationCounter, this.id, this.name, this.surname, this.email);

  factory EmployeeInsertResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInsertResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInsertResponseDtoToJson(this);
}
