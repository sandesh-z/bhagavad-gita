import 'dart:async';
import 'package:bhagavad_gita/core/failure/network/network.dart';
import 'package:bhagavad_gita/features/models/chapter_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure/api_failure.dart';
import '../../core/shared_preferences/api_keys.dart';
import '../models/verse_model.dart';

abstract class BhagavadRemoteDataSource {
  Future<Either<ApiFailure, List<ChapterModel>>> getAllchapters();
  Future<Either<ApiFailure, ChapterModel>> getChapter(int chapter);

  Future<Either<ApiFailure, List<VerseModel>>> getAllVerses(int chapter);
  Future<Either<ApiFailure, VerseModel>> getVerseDetails(
      int chapter, int verse);
}

var headers = {
  'X-RapidAPI-Key': apiKey,
  'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
};

@LazySingleton(as: BhagavadRemoteDataSource)
class BhagavadRemoteDataSoureImpl implements BhagavadRemoteDataSource {
  final Dio dio;
  final NetworkInfo networkInfo;
  BhagavadRemoteDataSoureImpl({
    required this.dio,
    required this.networkInfo,
  });
  @override
  Future<Either<ApiFailure, List<ChapterModel>>> getAllchapters() async {
    final isConnected = await networkInfo.isConnected;

    var params = {'limit': '18'};

    if (!isConnected) {
      throw const ApiFailure.noInternetConnection();
    }
    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/',
          queryParameters: params,
          options: Options(headers: headers));

      final responseBody = response.data as Iterable;

      return Right(List<ChapterModel>.from(responseBody
          .map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      throw ApiFailure.serverError(message: e.toString());
    }
  }

  @override
  Future<Either<ApiFailure, List<VerseModel>>> getAllVerses(int chapter) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      throw const ApiFailure.noInternetConnection();
    }
    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapter/verses/',
          options: Options(headers: headers));

      final responseBody = response.data as Iterable;

      return Right(List<VerseModel>.from(responseBody
          .map((e) => VerseModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      throw ApiFailure.serverError(message: e.toString());
    }
  }

  @override
  Future<Either<ApiFailure, VerseModel>> getVerseDetails(
      int chapter, int verse) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      throw const ApiFailure.noInternetConnection();
    }
    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapter/verses/$verse/',
          options: Options(headers: headers));
      return Right(VerseModel.fromJson(response.data));
    } catch (e) {
      throw ApiFailure.serverError(message: e.toString());
    }
  }

  @override
  Future<Either<ApiFailure, ChapterModel>> getChapter(int chapter) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      throw const ApiFailure.noInternetConnection();
    }
    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapter/',
          options: Options(headers: headers));

      return Right(ChapterModel.fromJson(response.data));
    } catch (e) {
      throw ApiFailure.serverError(message: e.toString());
    }
  }
}
