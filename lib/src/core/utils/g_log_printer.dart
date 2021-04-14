import 'package:logger/logger.dart';

class GLogPrinter extends PrettyPrinter {
  final String className;

  GLogPrinter(this.className) : super(methodCount: 0);


  @override
  List<String> log(LogEvent event) {
    List<String> buffer = [];

    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];

    buffer.add(color('$emoji $className - ${event.message}'));

    final errorStr = event.error?.toString();

    if (event.error != null) {
      var errorColor = color;
      for (var line in errorStr.split('\n')) {
        buffer.add(errorColor(line));
      }
    }

    String stackTraceStr;
    if (event.stackTrace == null) {
      if (methodCount > 0) {
        stackTraceStr = formatStackTrace(StackTrace.current, methodCount);
      }
    } else if (errorMethodCount > 0) {
      stackTraceStr = formatStackTrace(event.stackTrace, errorMethodCount);
    }

    if (event.stackTrace != null) {
      for (var line in stackTraceStr.split('\n')) {
        buffer.add(color(line));
      }
    }


    return buffer;
  }

}
