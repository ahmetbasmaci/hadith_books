part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  final List<HadithBooksEnum> selectedHadithEnums;

  const FavoriteState({required this.selectedHadithEnums});

  const FavoriteState.init() : selectedHadithEnums = HadithBooksEnum.values;

  FavoriteState copyWith({List<HadithBooksEnum>? selectedHadithEnums});

  @override
  List<Object> get props => [selectedHadithEnums];
}

class FavoriteInitState extends FavoriteState {
  const FavoriteInitState({List<HadithBooksEnum>? selectedHadithEnums})
      : super(selectedHadithEnums: selectedHadithEnums ?? HadithBooksEnum.values);

  @override
  FavoriteState copyWith({List<HadithBooksEnum>? selectedHadithEnums}) {
    return FavoriteInitState(
      selectedHadithEnums: selectedHadithEnums ?? this.selectedHadithEnums,
    );
  }

  @override
  List<Object> get props => [selectedHadithEnums];
}

class FavoriteLoadedState extends FavoriteState {
  final List<HadithEntity> favoriteZikrModels;

  const FavoriteLoadedState({required this.favoriteZikrModels, required super.selectedHadithEnums});

  @override
  FavoriteState copyWith({List<HadithEntity>? favoriteZikrModels, List<HadithBooksEnum>? selectedHadithEnums}) {
    return FavoriteLoadedState(
      favoriteZikrModels: favoriteZikrModels ?? this.favoriteZikrModels,
      selectedHadithEnums: selectedHadithEnums ?? this.selectedHadithEnums,
    );
  }

  @override
  List<Object> get props => [favoriteZikrModels, selectedHadithEnums];
}

class FavoriteErrorState extends FavoriteState {
  final String message;

  const FavoriteErrorState({required this.message, required super.selectedHadithEnums});

  @override
  FavoriteState copyWith({String? message, List<HadithBooksEnum>? selectedHadithEnums}) {
    return FavoriteErrorState(
      message: message ?? this.message,
      selectedHadithEnums: selectedHadithEnums ?? this.selectedHadithEnums,
    );
  }

  @override
  List<Object> get props => [message, selectedHadithEnums];
}
