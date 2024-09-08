import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

class SaveSelectedBooksParams extends Equatable {
  final List<HadithBooksEnum> selectedHadithsInSearch;

  const SaveSelectedBooksParams(this.selectedHadithsInSearch);

  @override
  List<Object?> get props => [selectedHadithsInSearch];
}
