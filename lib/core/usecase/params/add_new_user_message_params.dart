
import 'package:equatable/equatable.dart';

class AddNewUserMessageParams extends Equatable {
  final String name;
  final String message;

  const AddNewUserMessageParams({required this.name, required this.message});

  @override
  List<Object?> get props => [name, message];
}
