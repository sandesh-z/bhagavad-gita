import 'dart:async';
import 'package:bhagavad_gita/models/chapter_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/verse_model.dart';

abstract class BhagavadRemoteDataSource {
  Future<Either<Exception, List<ChapterModel>>> getAllchapters();
  Future<Either<Exception, ChapterModel>> getChapter(int chapter);

  Future<Either<Exception, List<VerseModel>>> getAllVerses(int chapter);
  Future<Either<Exception, ChapterModel>> getVerseDetails(
      int chapter, int verse);
}

@LazySingleton(as: BhagavadRemoteDataSource)
class BhagavadRemoteDataSoureImpl implements BhagavadRemoteDataSource {
  final Dio dio;
  BhagavadRemoteDataSoureImpl({required this.dio});
  @override
  Future<Either<Exception, List<ChapterModel>>> getAllchapters() async {
    var headers = {
      'X-RapidAPI-Key': 'c54f17e36dmshda1f1fded6b6f01p17b842jsn3738b297c33a',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    };
    var params = {'limit': '18'};
    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/',
          queryParameters: params,
          options: Options(headers: headers));

      final responseBody = response.data as Iterable;

      return Right(List<ChapterModel>.from(responseBody
          .map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Exception, List<VerseModel>>> getAllVerses(int chapter) async {
    var headers = {
      'X-RapidAPI-Key': 'c54f17e36dmshda1f1fded6b6f01p17b842jsn3738b297c33a',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    };

    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapter/verses/',
          options: Options(headers: headers));

      final responseBody = response.data as Iterable;

      return Right(List<VerseModel>.from(responseBody
          .map((e) => VerseModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Exception, ChapterModel>> getVerseDetails(
      int chapter, int verse) async {
    var headers = {
      'X-RapidAPI-Key': 'c54f17e36dmshda1f1fded6b6f01p17b842jsn3738b297c33a',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    };

    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapter/verses/$verse/',
          options: Options(headers: headers));

      return Right(ChapterModel.fromJson(response.data));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Exception, ChapterModel>> getChapter(int chapter) async {
    var headers = {
      'X-RapidAPI-Key': 'c54f17e36dmshda1f1fded6b6f01p17b842jsn3738b297c33a',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    };

    try {
      final response = await dio.get(
          'https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$chapter/',
          options: Options(headers: headers));

      return Right(ChapterModel.fromJson(response.data));
    } catch (e) {
      throw Exception();
    }
  }
}
