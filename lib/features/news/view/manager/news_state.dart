part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsState {}
final class NewsSuccessState extends NewsState {}
final class NewsErrorState extends NewsState {
  final String error;
  NewsErrorState(this.error);
}
