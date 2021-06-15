import 'package:devon4ng_flutter_application_template/config/config.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeedetail/employee_detail_response_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_request_dto.dart';
import 'package:devon4ng_flutter_application_template/model/network/employeelist/employee_list_response_dto.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'authentication/login_request_dto.dart';
import 'employeeinsert/employee_insert_request_dto.dart';
import 'employeeinsert/employee_insert_response_dto.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Endpoint.kCurrentEndopoint)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/login")
  Future<void> login(
      @Body() LoginRequestDto dto, @Path("apiVersion") String apiVersion);

  //@POST("/employeemanagement/{apiVersion}/employee/")
  //Future<void> add(@Body() EmployeeDetailDto dto, @Path("apiVersion") String apiVersion);

  @POST("/employeemanagement/{apiVersion}/employee/search")
  Future<EmployeeListResponseDto> search(@Path("apiVersion") String apiVersion,
      @Body() EmployeeListRequestDto dto);

  @GET("/employeemanagement/{apiVersion}/employee/{id}")
  Future<EmployeeDetailResponseDto> getDetail(
      @Path("apiVersion") String apiVersion, @Path("id") int id);

  @POST("/employeemanagement/{apiVersion}/employee")
  Future<EmployeeInsertResponseDto> insert(
      @Path("apiVersion") String apiVersion,
      @Body() EmployeeInsertRequestDto dto);

  //@POST("/employeemanagement/{apiVersion}/employee/")
  //Future<void> update(@Body() EmployeeDetailDto dto, @Path("apiVersion") String apiVersion);

  @DELETE("/employeemanagement/{apiVersion}/employee/{id}")
  Future<void> delete(
      @Path("apiVersion") String apiVersion, @Path("id") int id);
}
