import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:imepay/src/core/dependency_injection/dependency_injection.dart';
import 'package:injectable/injectable.dart';

import '../../utils/exception_manager.dart';
import 'api.dart';

typedef TransferProgress = void Function(int, int);

@lazySingleton
class ApiClient {
  late final Dio _dio;

  ApiClient({
    required Dio dio,
  }) : _dio = dio
          ..options = BaseOptions(
            baseUrl: Endpoints.baseUrl,
            headers: Endpoints.headers,
            connectTimeout: Endpoints.timeoutDuration,
            sendTimeout: Endpoints.timeoutDuration,
            receiveTimeout: Endpoints.timeoutDuration,
            contentType: Headers.jsonContentType,
          ) {
    _dio.interceptors.add(
      CustomInterceptor(),
    );
  }

  Future<Response<dynamic>> _handleRequest(
      Future<Response<dynamic>> Function() request) async {
    final isConnected = await locator<NetworkInfo>().isConnected;
    if (isConnected) {
      try {
        return await request();
      } catch (e) {
        if (e is DioException) {
          throw ExceptionManager.getException(
            e.response?.statusCode,
          );
        } else {
          rethrow;
        }
      }
    } else {
      throw const SocketException("No internet connection");
    }
  }

  Future<Response<dynamic>> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParams,
    TransferProgress? recieveProgress,
    Options? options,
  }) async =>
      _handleRequest(
        () => _dio.get<dynamic>(
          path,
          data: data,
          queryParameters: queryParams,
          onReceiveProgress: recieveProgress,
          options: options,
        ),
      );

  Future<Response<dynamic>> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParams,
    TransferProgress? recieveProgress,
    Options? options,
  }) async =>
      _handleRequest(
        () => _dio.post<dynamic>(
          path,
          data: data,
          queryParameters: queryParams,
          onReceiveProgress: recieveProgress,
          options: options,
        ),
      );

  Future<Response<dynamic>> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParams,
    TransferProgress? recieveProgress,
    Options? options,
  }) async =>
      _handleRequest(
        () => _dio.delete<dynamic>(
          path,
          data: data,
          queryParameters: queryParams,
          options: options,
        ),
      );
}

class CustomInterceptor implements InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log('BaseUrl: ${options.method} ${options.baseUrl}${options.path}');
    if (options.data != null) log('Data: ${jsonEncode(options.data)}');
    if (options.queryParameters.isNotEmpty) {
      log('Query: ${jsonEncode(options.queryParameters)}');
    }
    log('Headers: ${jsonEncode(options.headers)}');
    return handler.next(options);
  }

  @override
  onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    log('RESPONSE => statusCode: ${response.statusCode}, data: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.message != null) log("Msg: ${err.message}");
    log('Type: ${err.type}');
    if (err.requestOptions.data != null) {
      log('Data: ${err.requestOptions.data}');
    }
    return handler.next(err);
  }
}
