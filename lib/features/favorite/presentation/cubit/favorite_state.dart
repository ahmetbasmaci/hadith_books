part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  final FavoriteHadithTypeEnum favoriteHadithTypeEnum;

  const FavoriteState({required this.favoriteHadithTypeEnum});

  const FavoriteState.init() : favoriteHadithTypeEnum = FavoriteHadithTypeEnum.all;

  @override
  List<Object> get props => [favoriteHadithTypeEnum];
}

class FavoriteInitState extends FavoriteState {
  const FavoriteInitState({FavoriteHadithTypeEnum? favoriteHadithTypeEnum})
      : super(favoriteHadithTypeEnum: favoriteHadithTypeEnum ?? FavoriteHadithTypeEnum.all);

  @override
  List<Object> get props => [favoriteHadithTypeEnum];
}

class FavoriteLoadedState extends FavoriteState {
  final List<HadithEntity> favoriteZikrModels;

  const FavoriteLoadedState({required this.favoriteZikrModels, required super.favoriteHadithTypeEnum});

  @override
  List<Object> get props => [favoriteZikrModels, favoriteHadithTypeEnum];
}

class FavoriteErrorState extends FavoriteState {
  final String message;

  const FavoriteErrorState({required this.message, required super.favoriteHadithTypeEnum});

  @override
  List<Object> get props => [message, favoriteHadithTypeEnum];
}
