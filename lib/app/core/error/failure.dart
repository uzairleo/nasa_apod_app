import 'package:equatable/equatable.dart';

/// Super class for all Failure types,
/// e.g: [ServerFailure] for all server related exceptions
/// [CacheFailure] for all caching related exceptions
abstract class Failure extends Equatable {
  final String _code;
  final List<String> _messages;

  const Failure(this._code, this._messages);

  String get code => _code;
  List<String> get messages => _messages;
}
