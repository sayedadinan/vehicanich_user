part of 'bottom_nav_bloc.dart';

sealed class BottomNavigationBarState {
  final int page;

  BottomNavigationBarState({required this.page});
}

final class NavBarInitial extends BottomNavigationBarState {
  NavBarInitial({required super.page});
}
