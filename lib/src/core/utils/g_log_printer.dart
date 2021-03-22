import 'package:logger/logger.dart';

class GLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    print(event.message);
    return [event.message];
  }
}
