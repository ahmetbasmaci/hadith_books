import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../features.dart';
part 'hadith_home_state.dart';

class HadithHomeCubit extends Cubit<HadithHomeState> {
  final GetHadithBookUseCase getHadithBookUseCase;
  HadithHomeCubit(this.getHadithBookUseCase) : super(HadithHomeInitial());
}
