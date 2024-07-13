import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/usecase/params/hadith_book_params.dart';
import '../../domain/entities/hadith_book_entity.dart';
import '../../domain/usecases/get_hadith_book_use_case.dart';

part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  HadithHomeCubit(this.getHadithBookUseCase) : super(HadithHomeInitial());

  
}
