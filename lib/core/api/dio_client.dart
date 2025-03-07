import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../common/error/failures.dart';
import '../hive/hive.dart';
import 'dio_interceptor.dart';
import 'isolate_parser.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient with MainBoxMixin {
  String baseUrl ="http://10.0.2.2:8000";

  String? _auth;
  bool _isUnitTest = false;
  late Dio _dio;

  DioClient({bool isUnitTest = false}) {
    _isUnitTest = isUnitTest;

    try {
      _auth = getData(MainBoxKeys.access_token);
    } catch (_) {}

    _dio = _createDio();

    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      /// Return static dio if is unit test
      return _dio;
    } else {
      /// We need to recreate dio to avoid token issue after login
      try {
        _auth = getData(MainBoxKeys.access_token);
      } catch (_) {}

      final dio = _createDio();

      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());

      return dio;
    }
  }

  Dio _createDio() => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (_auth != null) ...{

          'Authorization': "Bearer "+_auth.toString(),
        },
      },
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      validateStatus: (int? status) {
        return status! > 0;
      },
    ),
  );

  Future<Either<Failure, T>> getRequest<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        required ResponseConverter<T> converter,
        bool isIsolate = true,
      }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e, stackTrace) {
      // if (!_isUnitTest) {
      //   nonFatalError(error: e, stackTrace: stackTrace);
      // }
      return Left(
        ServerFailure(
          e.response?.data['error'] as String? ?? e.message,
        ),
      );
    }
  }

  Future<Either<Failure, T>> postRequest<T>(
      String url, {
        Map<String, dynamic>? data,
        required ResponseConverter<T> converter,
        bool isIsolate = true,
      }) async {
    try {
      final response = await dio.post(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e, stackTrace) {
      // if (!_isUnitTest) {
      //   nonFatalError(error: e, stackTrace: stackTrace);
      // }
      String error ='';
      if (e.response?.data['narration']!=null){
        error=e.response?.data['narration'] as String;

      }
      else{
        error=e.response?.data['narration'] as String;
      }


      return Left(
        ServerFailure(
          error,

        ),
      );
    }
  }
}