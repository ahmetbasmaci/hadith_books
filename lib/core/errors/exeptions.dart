import 'package:equatable/equatable.dart';

abstract class Exeptions extends Equatable implements Exception {
  final String message;

  const Exeptions(this.message);

  @override
  List<Object> get props => [message];
}

class JsonExeption extends Exeptions {
  const JsonExeption(super.message);
}
