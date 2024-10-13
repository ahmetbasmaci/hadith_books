part of 'expand_all_option_cubit.dart';

class ExpandAllOptionState extends Equatable {
  final bool isTextsExpanded;
  const ExpandAllOptionState([this.isTextsExpanded = false]);

  @override
  List<Object> get props => [isTextsExpanded];
}
