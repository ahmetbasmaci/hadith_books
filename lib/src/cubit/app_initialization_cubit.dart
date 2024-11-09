import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/features/features.dart';

part 'app_initialization_state.dart';

class AppInitializationCubit extends Cubit<AppInitializationState> {
  final HadithHomeCubit _hadithHomeCubit;
  AppInitializationCubit(this._hadithHomeCubit) : super(AppInitializationCubitInitial());

  Future<void> initializeApp() async {
    emit(InitializationLoadingState());

    // Wait for each cubit's initialization method
    await _initializeCubits();

    emit(InitializationCompletedState());
  }

  Future<void> _initializeCubits() async {
    await Future.wait([
      _hadithHomeCubit.init(),
    ]);
  }
}
