import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../features.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  final ScrollController scrollController = ScrollController();
  HadithHomeCubit(this.getHadithBookUseCase) : super(HadithHomeInitial());
}
