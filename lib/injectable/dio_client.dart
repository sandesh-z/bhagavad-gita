import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioProvider {
  @singleton
  final _dio = Dio();
  Dio get dio => _dio;
}
