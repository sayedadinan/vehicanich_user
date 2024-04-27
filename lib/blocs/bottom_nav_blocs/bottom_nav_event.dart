part of 'bottom_nav_bloc.dart';

sealed class BottomNavigationBarEvent {}

final class BottomnavbarPressed extends BottomNavigationBarEvent {
  final int page;

  BottomnavbarPressed({required this.page});
}
