import 'package:customer/src/core/utils/g_log_printer.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:customer/src/core/models/secret.dart';

Logger getLogger(String className) {
  return Logger(printer: GLogPrinter(className));
}

// Loading secrets
Secrets _secretCache;

Secrets get secrets {
  assert(_secretCache != null, 'No secret available, did you forget to call loadSecret() in main() ?');
  return _secretCache;
}

Future<Secrets> loadSecrets() async {
  if(_secretCache != null)
    return _secretCache;
  final String secretPath = "assets/configs/secrets.json";

  // loadStructuredData has inbuilt caching mechanism
  return rootBundle.loadStructuredData<Secrets>(
    secretPath,
    (jsonStr) async {
      _secretCache = Secrets.fromJson(json.decode(jsonStr));
      return _secretCache;
    },
  );
}
