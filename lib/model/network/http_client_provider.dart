import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClientProvider {
  static const int SEND_TIMEOUT = 10000;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 30000;
  static var cookieJar = DefaultCookieJar();
  static String? csfrToken;

  final Dio client;

  HttpClientProvider._(this.client);

  factory HttpClientProvider.standard() {
    BaseOptions baseOptions = BaseOptions(
      sendTimeout: SEND_TIMEOUT,
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      headers: {
        "Accept": "application/json",
      },
    );

    var dio = Dio(baseOptions);
    if (csfrToken != null) {
      dio.options.headers.putIfAbsent("x-csrf-token", () => csfrToken);
    }

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));

    dio.interceptors.add(CookieManager(cookieJar));
    return new HttpClientProvider._(dio);
  }

  factory HttpClientProvider.custom(BaseOptions baseOptions) {
    return new HttpClientProvider._(Dio(baseOptions));
  }
}
