part of 'search_bloc.dart';

sealed class SearchState {
  final String query;

  SearchState({required this.query});
}

final class SearchInitial extends SearchState {
  SearchInitial({required super.query});
}
