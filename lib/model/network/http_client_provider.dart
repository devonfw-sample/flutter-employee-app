import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClientProvider {
  static const int SEND_TIMEOUT = 10000;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 30000;
  static String? bearer;

  final Dio client;

  HttpClientProvider._(this.client);

  factory HttpClientProvider.standard() {
    BaseOptions baseOptions = BaseOptions(
        sendTimeout: SEND_TIMEOUT,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT);

    var dio = Dio(baseOptions);

    dio.interceptors.add(JWTInterceptor());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));

    return new HttpClientProvider._(dio);
  }

  factory HttpClientProvider.custom(BaseOptions baseOptions) {
    return new HttpClientProvider._(Dio(baseOptions));
  }
}

class JWTInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (getBearer() != null) {
      options.headers.putIfAbsent("Authorization", () => getBearer());
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.headers.forEach((name, values) {
      if (name == "authorization") {
        setBearer(values[0]);
      }
    });
    super.onResponse(response, handler);
  }

  String? getBearer() {
    return HttpClientProvider.bearer;
  }

  void setBearer(String bearer) {
    HttpClientProvider.bearer = bearer;
  }
}
