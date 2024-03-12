part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required Key? key,
    required bool isLoading,
    required bool failure,
    required List<ChapterModel> allChapters,
    required ChapterModel? chapter,
    required List<VerseModel> allVerses,
    required VerseModel? verse,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
      key: UniqueKey(),
      isLoading: false,
      allChapters: [],
      chapter: null,
      allVerses: [],
      failure: false,
      verse: null);
}
