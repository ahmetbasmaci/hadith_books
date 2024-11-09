part of 'app_initialization_cubit.dart';

sealed class AppInitializationState extends Equatable {
  const AppInitializationState();

  @override
  List<Object> get props => [];
}

final class AppInitializationCubitInitial extends AppInitializationState {}

final class InitializationLoadingState extends AppInitializationState {}

final class InitializationCompletedState extends AppInitializationState {}
