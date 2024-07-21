import 'package:equatable/equatable.dart';

import '../../../features/features.dart';

class FavoriteParams extends Equatable {
  final HadithEntity item;

  const FavoriteParams({required this.item});

  @override
  List<Object?> get props => [item];
}
