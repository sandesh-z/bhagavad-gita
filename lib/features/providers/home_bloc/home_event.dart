part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.setInitialState() = _SetinitialState;
  const factory HomeEvent.getAllChapters() = _GetAllChapters;
  const factory HomeEvent.getChapter(int chapter) = _GetChapter;
  const factory HomeEvent.getAllVerses(int chapter) = _GetAllVerses;
  const factory HomeEvent.getVerse() = _GetPaticularVerse;
}
