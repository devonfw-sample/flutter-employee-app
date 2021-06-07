import 'package:devon4ng_flutter_application_template/model/network/common/pageable_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/common/pageable_sort_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeedetail/employee_detail_response_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeeinsert/employee_insert_request_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeeinsert/employee_insert_response_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_request_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_response_dto.dart';
import 'package:devon4ng_flutter_application_template/model/repository/abstract_repository.dart';

class EmployeeListRepository extends AbstractRepository {
  Future<EmployeeListResponseDto> search(int pageSize, int pageNumber) {
    var sort = PageableSortDto("employeeId", "ASC");
    var pageable = PageableDto(pageSize, pageNumber, [sort]);
    var request = EmployeeListRequestDto(null, null, null, null, pageable);

    return restClient.search(apiVersion, request);
  }

  Future<EmployeeDetailResponseDto> getDetail(int id) {
    return restClient.getDetail(apiVersion, id);
  }

  Future<EmployeeInsertResponseDto> insert(
      String name, String surname, String email) {
    EmployeeInsertRequestDto dto =
        EmployeeInsertRequestDto(name, surname, email);
    return restClient.insert(apiVersion, dto);
  }

  Future<void> delete(int id) {
    return restClient.delete(apiVersion, id);
  }
}
