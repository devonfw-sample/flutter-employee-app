// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://10.0.2.2:8081/services/rest/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<void> login(dto, apiVersion) async {
    ArgumentError.checkNotNull(dto, 'dto');
    ArgumentError.checkNotNull(apiVersion, 'apiVersion');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto?.toJson() ?? <String, dynamic>{});
    await _dio.request<void>('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<EmployeeListResponseDto> search(apiVersion, dto) async {
    ArgumentError.checkNotNull(apiVersion, 'apiVersion');
    ArgumentError.checkNotNull(dto, 'dto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/employeemanagement/$apiVersion/employee/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EmployeeListResponseDto.fromJson(_result.data);
    return value;
  }

  @override
  Future<EmployeeDetailResponseDto> getDetail(apiVersion, id) async {
    ArgumentError.checkNotNull(apiVersion, 'apiVersion');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/employeemanagement/$apiVersion/employee/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EmployeeDetailResponseDto.fromJson(_result.data);
    return value;
  }

  @override
  Future<EmployeeInsertResponseDto> insert(apiVersion, dto) async {
    ArgumentError.checkNotNull(apiVersion, 'apiVersion');
    ArgumentError.checkNotNull(dto, 'dto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/employeemanagement/$apiVersion/employee',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EmployeeInsertResponseDto.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> delete(apiVersion, id) async {
    ArgumentError.checkNotNull(apiVersion, 'apiVersion');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/employeemanagement/$apiVersion/employee/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }
}
