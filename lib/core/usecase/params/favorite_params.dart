import 'package:equatable/equatable.dart';
import 'package:hadith_books/features/hadith_home/hadith_home.dart';

class FavoriteParams extends Equatable {
  final HadithEntity item;

  const FavoriteParams({required this.item});

  @override
  List<Object?> get props => [item];
}
