part of 'favorite_filter_cubit.dart';

sealed class FavoriteFilterState extends Equatable {
  final List<HadithBooksEnum> selectedHadithsInFavorite;
  const FavoriteFilterState({required this.selectedHadithsInFavorite});

  @override
  List<Object> get props => [selectedHadithsInFavorite];
}

final class FavoriteFilterInitial extends FavoriteFilterState {
  const FavoriteFilterInitial({required super.selectedHadithsInFavorite});

  @override
  List<Object> get props => [selectedHadithsInFavorite];
}
