part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  final List<HadithBooksEnum> selectedHadithBookEnums;

  const FavoriteState({required this.selectedHadithBookEnums});

  const FavoriteState.init() : selectedHadithBookEnums = HadithBooksEnum.values;

  FavoriteState copyWith({List<HadithBooksEnum>? selectedHadithBookEnums});

  @override
  List<Object> get props => [selectedHadithBookEnums];
}

class FavoriteInitState extends FavoriteState {
  const FavoriteInitState({List<HadithBooksEnum>? selectedHadithEnums})
      : super(selectedHadithBookEnums: selectedHadithEnums ?? HadithBooksEnum.values);

  @override
  FavoriteState copyWith({List<HadithBooksEnum>? selectedHadithBookEnums}) {
    return FavoriteInitState(
      selectedHadithEnums: selectedHadithBookEnums ?? this.selectedHadithBookEnums,
    );
  }

  @override
  List<Object> get props => [selectedHadithBookEnums];
}

class FavoriteLoadedState extends FavoriteState {
  final List<HadithBookEntity> selectedHadithBookEntitys;
  const FavoriteLoadedState({required this.selectedHadithBookEntitys, required super.selectedHadithBookEnums});

  @override
  FavoriteState copyWith(
      {List<HadithBookEntity>? selectedHadithBookEntitys, List<HadithBooksEnum>? selectedHadithBookEnums}) {
    return FavoriteLoadedState(
      selectedHadithBookEntitys: selectedHadithBookEntitys ?? this.selectedHadithBookEntitys,
      selectedHadithBookEnums: selectedHadithBookEnums ?? this.selectedHadithBookEnums,
    );
  }

  @override
  List<Object> get props => [selectedHadithBookEnums];
}

class FavoriteErrorState extends FavoriteState {
  final String message;

  const FavoriteErrorState({required this.message, required super.selectedHadithBookEnums});

  @override
  FavoriteState copyWith({String? message, List<HadithBooksEnum>? selectedHadithBookEnums}) {
    return FavoriteErrorState(
      message: message ?? this.message,
      selectedHadithBookEnums: selectedHadithBookEnums ?? this.selectedHadithBookEnums,
    );
  }

  @override
  List<Object> get props => [message, selectedHadithBookEnums];
}

class FavoriteLoadingState extends FavoriteState {
  const FavoriteLoadingState() : super(selectedHadithBookEnums: const []);

  @override
  FavoriteState copyWith({List<HadithBooksEnum>? selectedHadithBookEnums}) {
    return FavoriteLoadingState();
  }

  @override
  List<Object> get props => [selectedHadithBookEnums];
}
