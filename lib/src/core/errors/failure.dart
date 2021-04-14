class Failure extends Error{
  final String message;

  Failure({this.message});

  @override
  String toString() => 'Failure{message: $message}';

  @override
  StackTrace get stackTrace => super.stackTrace;

}
