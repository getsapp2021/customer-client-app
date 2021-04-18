class Failure extends Error{
  final String message;
  final dynamic error;

  Failure({this.message, this.error});

  @override
  String toString() => 'Failure{message: $message}';

  @override
  StackTrace get stackTrace => super.stackTrace;

}
