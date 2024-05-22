part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchValueAdded extends SearchEvent {
  final String value;

  SearchValueAdded({required this.value});
}
