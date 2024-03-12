import 'dart:async';

import 'package:bhagavad_gita/datasource/bhagavad_remote_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/chapter_model.dart';
import '../../models/verse_model.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BhagavadRemoteDataSource bhagavadRemoteDataSource;
  HomeBloc(this.bhagavadRemoteDataSource) : super(HomeState.initial()) {
    on<_SetinitialState>(_onSetinitialState);
    on<_GetAllChapters>(_onGetAllChapters);
    on<_GetChapter>(_onGetChapter);
    on<_GetAllVerses>(_onGetAllVerses);
  }
  FutureOr<void> _onSetinitialState(
      _SetinitialState event, Emitter<HomeState> emit) {
    emit(state.copyWith(isLoading: true, key: UniqueKey()));
  }

  FutureOr<void> _onGetAllChapters(
      _GetAllChapters event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final res = await bhagavadRemoteDataSource.getAllchapters();
    emit(res.fold((l) => state.copyWith(isLoading: false),
        (r) => state.copyWith(allChapters: r, isLoading: false)));
  }

  FutureOr<void> _onGetAllVerses(
      _GetAllVerses event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final res = await bhagavadRemoteDataSource.getAllVerses(event.chapter);
    emit(res.fold((l) => state.copyWith(isLoading: false),
        (r) => state.copyWith(allVerses: r, isLoading: false)));
  }

  FutureOr<void> _onGetChapter(
      _GetChapter event, Emitter<HomeState> emit) async {
    final res = await bhagavadRemoteDataSource.getChapter(event.chapter);
    emit(res.fold((l) => state.copyWith(), (r) => state.copyWith(chapter: r)));
  }
}
