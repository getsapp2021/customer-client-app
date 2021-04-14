import 'package:customer/src/core/utils/g_log_printer.dart';
import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: GLogPrinter(className));
}
