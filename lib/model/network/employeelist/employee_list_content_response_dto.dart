import 'package:json_annotation/json_annotation.dart';
part 'employee_list_content_response_dto.g.dart';

@JsonSerializable()
class EmployeeListContentResponseDto {
  final int modificationCounter;
  final int id;
  final int employeeId;
  final String name;
  final String surname;
  final String email;

  EmployeeListContentResponseDto(this.modificationCounter, this.id, this.employeeId, this.name, this.surname, this.email);

  factory EmployeeListContentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListContentResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListContentResponseDtoToJson(this);
}
